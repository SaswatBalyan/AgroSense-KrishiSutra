import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/widgets/ks_card.dart';
import '../../shared/widgets/ks_primary_button.dart';
import 'camera_service.dart';
import 'disease_provider.dart';
import 'tflite_inference_service.dart';

class PocketScientistScreen extends ConsumerStatefulWidget {
  const PocketScientistScreen({super.key});

  @override
  ConsumerState<PocketScientistScreen> createState() =>
      _PocketScientistScreenState();
}

class _PocketScientistScreenState extends ConsumerState<PocketScientistScreen> {
  final _cameraService = CameraService();
  Uint8List? _capturedImage;
  DiagnosisPrediction? _prediction;
  String? _diagnosisError;
  bool _loading = false;

  Future<void> _capture(ImageSource source) async {
    setState(() => _loading = true);
    try {
      final image = await _cameraService.captureLeaf(source: source);
      if (image != null) {
        if (mounted) {
          setState(() {
            _capturedImage = image;
            _prediction = null;
            _diagnosisError = null;
          });
        }
        try {
          final prediction = await ref
              .read(diagnosisServiceProvider)
              .classifyAndSave(image);
          if (mounted) setState(() => _prediction = prediction);
        } on ModelUnavailableException catch (error) {
          if (mounted) setState(() => _diagnosisError = error.message);
        } on FormatException catch (error) {
          if (mounted) setState(() => _diagnosisError = error.message);
        }
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenMargin,
            AppSpacing.md,
            AppSpacing.screenMargin,
            AppSpacing.xl,
          ),
          children: [
            Text(l10n.pocketScientist, style: text.headlineSmall),
            const SizedBox(height: AppSpacing.sm),
            Text(
              l10n.captureHint,
              style: text.bodyLarge?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.lg),
            AspectRatio(
              aspectRatio: 4 / 5,
              child: Container(
                decoration: BoxDecoration(
                  color: _capturedImage == null
                      ? AppColors.juniper
                      : AppColors.dawn,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                ),
                child: _capturedImage == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            PhosphorIconsRegular.leaf,
                            size: 72,
                            color: AppColors.sage,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.lg,
                            ),
                            child: Text(
                              l10n.captureLeaf,
                              textAlign: TextAlign.center,
                              style: text.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusLg,
                        ),
                        child: Image.memory(
                          _capturedImage!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            KsPrimaryButton(
              label: l10n.runScan,
              icon: PhosphorIconsRegular.camera,
              onPressed: _loading ? null : () => _capture(ImageSource.camera),
            ),
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton.icon(
              onPressed: _loading ? null : () => _capture(ImageSource.gallery),
              icon: Icon(PhosphorIconsRegular.image),
              label: const Text('Choose from gallery'),
            ),
            if (_loading) ...[
              const SizedBox(height: AppSpacing.md),
              const LinearProgressIndicator(),
            ],
            if (_capturedImage != null && !_loading) ...[
              const SizedBox(height: AppSpacing.lg),
              KsCard(
                color: const Color(0xFFE8EFE3),
                radius: AppSpacing.radiusLg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _prediction?.label ?? l10n.diagnosis,
                      style: text.headlineSmall,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      _prediction == null
                          ? (_diagnosisError ?? 'Preparing diagnosis...')
                          : '${_prediction!.label} (${(_prediction!.confidence * 100).toStringAsFixed(1)}%)',
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      _prediction?.remedy ?? l10n.remedy,
                      style: text.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
