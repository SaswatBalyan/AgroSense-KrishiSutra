import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/mock_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/local_dashboard_repository.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/providers/onboarding_provider.dart';
import '../../shared/widgets/ks_primary_button.dart';

class FarmProfileScreen extends ConsumerStatefulWidget {
  const FarmProfileScreen({super.key});

  @override
  ConsumerState<FarmProfileScreen> createState() => _FarmProfileScreenState();
}

class _FarmProfileScreenState extends ConsumerState<FarmProfileScreen> {
  late final TextEditingController _name;
  late final TextEditingController _place;
  late final TextEditingController _size;
  late final TextEditingController _crop;
  String? _saveError;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: MockData.farm.name);
    _place = TextEditingController(text: MockData.farm.place);
    _size = TextEditingController(text: '1.6');
    _crop = TextEditingController(text: MockData.farm.crop);
  }

  @override
  void dispose() {
    _name.dispose();
    _place.dispose();
    _size.dispose();
    _crop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.farmProfile)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenMargin,
            AppSpacing.md,
            AppSpacing.screenMargin,
            AppSpacing.lg,
          ),
          children: [
            Text(
              l10n.languageHint,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.lg),
            TextField(
              controller: _name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: l10n.farmName),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _place,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: l10n.location),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _size,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: l10n.farmSize),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _crop,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: l10n.crops),
            ),
            const SizedBox(height: AppSpacing.xl),
            KsPrimaryButton(
              label: l10n.saveAndGo,
              onPressed: () async {
                final size = double.tryParse(_size.text.trim());
                if (_name.text.trim().isEmpty ||
                    _place.text.trim().isEmpty ||
                    _crop.text.trim().isEmpty ||
                    size == null ||
                    size <= 0) {
                  setState(() => _saveError = l10n.farmProfile);
                  return;
                }

                try {
                  await ref
                      .read(localDashboardRepositoryProvider)
                      .saveFarm(
                        FarmsCompanion.insert(
                          name: _name.text.trim(),
                          place: _place.text.trim(),
                          sizeHectares: size,
                          primaryCrop: _crop.text.trim(),
                          latitude: MockData.farm.center.latitude,
                          longitude: MockData.farm.center.longitude,
                          updatedAt: DateTime.now(),
                        ),
                      );
                  // Demo seed data is deliberately back-dated so the first
                  // dashboard open treats it as stale and pulls live
                  // weather/prices (when API keys are configured).
                  final seededAt = DateTime.now().subtract(
                    const Duration(hours: 24),
                  );
                  await ref
                      .read(localDashboardRepositoryProvider)
                      .seedDashboardCache(
                        weather: WeatherCacheCompanion.insert(
                          location: _place.text.trim(),
                          temperature: MockData.weatherTemp,
                          summary: MockData.weatherSky,
                          humidity: int.parse(
                            MockData.humidity.replaceAll('%', ''),
                          ),
                          rainChance: int.parse(
                            MockData.rainChance.replaceAll('%', ''),
                          ),
                          observedAt: seededAt,
                        ),
                        prices: MockData.marketRows
                            .map(
                              (row) => MarketPricesCompanion.insert(
                                crop: row.crop,
                                mandi: row.mandi,
                                pricePerQuintal: int.parse(
                                  row.priceLabel
                                      .split(' ')
                                      .first
                                      .replaceAll(',', ''),
                                ),
                                delta: int.parse(row.deltaLabel),
                                observedAt: seededAt,
                              ),
                            )
                            .toList(),
                      );
                  if (!context.mounted) return;
                  ref.read(onboardingCompleteProvider.notifier).state = true;
                  context.go('/home');
                } catch (_) {
                  setState(() => _saveError = l10n.saveAndGo);
                }
              },
            ),
            if (_saveError != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                _saveError!,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.error),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
