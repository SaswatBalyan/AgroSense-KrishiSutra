import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/constants/mock_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/widgets/last_updated_banner.dart';

class WaterCompassScreen extends StatefulWidget {
  const WaterCompassScreen({super.key});

  @override
  State<WaterCompassScreen> createState() => _WaterCompassScreenState();
}

class _WaterCompassScreenState extends State<WaterCompassScreen> {
  LatLng? _pin;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenMargin,
                AppSpacing.md,
                AppSpacing.screenMargin,
                AppSpacing.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.waterCompass, style: text.headlineSmall),
                  const SizedBox(height: 4),
                  const LastUpdatedBanner(stamp: MockData.lastUpdated),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: MockData.farm.center,
                    initialZoom: 13.2,
                    onTap: (tap, point) => setState(() => _pin = point),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.krishi_sutra',
                    ),
                    PolygonLayer(
                      polygons: [
                        Polygon(
                          points: MockData.blueZone,
                          color: AppColors.blueZone.withValues(alpha: 0.28),
                          borderColor: AppColors.blueZone,
                          borderStrokeWidth: 1.5,
                        ),
                        Polygon(
                          points: MockData.redZone,
                          color: AppColors.redZone.withValues(alpha: 0.28),
                          borderColor: AppColors.redZone,
                          borderStrokeWidth: 1.5,
                        ),
                      ],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: MockData.farm.center,
                          width: 40,
                          height: 40,
                          child: Icon(
                            PhosphorIconsFill.house,
                            color: AppColors.juniper,
                            size: 28,
                          ),
                        ),
                        if (_pin != null)
                          Marker(
                            point: _pin!,
                            width: 40,
                            height: 40,
                            child: Icon(
                              PhosphorIconsFill.mapPin,
                              color: AppColors.tangerine,
                              size: 32,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  left: AppSpacing.screenMargin,
                  right: AppSpacing.screenMargin,
                  bottom: AppSpacing.md,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: AppColors.dawn.withValues(alpha: 0.96),
                          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                          border: Border.all(color: AppColors.hairline),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _LegendRow(
                              color: AppColors.blueZone,
                              label: l10n.blueZone,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            _LegendRow(
                              color: AppColors.redZone,
                              label: l10n.redZone,
                            ),
                            if (_pin != null) ...[
                              const SizedBox(height: AppSpacing.sm),
                              Text(l10n.borewellMarked, style: text.bodySmall),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: FilledButton.icon(
                          onPressed: () => setState(() => _pin = MockData.farm.center),
                          icon: Icon(PhosphorIconsRegular.mapPin),
                          label: Text(l10n.markBorewell),
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.moss,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendRow extends StatelessWidget {
  const _LegendRow({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }
}
