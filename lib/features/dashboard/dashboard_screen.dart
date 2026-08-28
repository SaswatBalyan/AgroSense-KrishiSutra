import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/constants/mock_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/widgets/ks_card.dart';
import '../../shared/widgets/last_updated_banner.dart';
import 'dashboard_providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  static String _formatStamp(DateTime observedAt) {
    final local = observedAt.toLocal();
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return 'Observed ${local.day} ${months[local.month - 1]}, $hour:$minute';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final text = Theme.of(context).textTheme;
    final farm = ref.watch(localFarmProvider).valueOrNull;
    final marketPrices = ref.watch(cachedMarketPricesProvider).valueOrNull;
    final weather = ref.watch(cachedWeatherProvider).valueOrNull;
    final farmName = farm?.name ?? MockData.farm.name;
    final farmPlace = farm?.place ?? MockData.farm.place;
    final farmSize = farm == null
        ? MockData.farm.sizeLabel
        : '${farm.sizeHectares} ha';
    final temperature = weather?.temperature ?? '--';
    final weatherSummary = weather?.summary ?? l10n.weatherNoData;
    final humidity = weather == null ? '--' : '${weather.humidity}%';
    final rainChance = weather == null ? '--' : '${weather.rainChance}%';
    final marketRows = (marketPrices ?? [])
        .map(
          (price) => MockMarketRow(
            crop: price.crop,
            mandi: price.mandi,
            priceLabel: '${price.pricePerQuintal} /q',
            deltaLabel: price.delta >= 0 ? '+${price.delta}' : '${price.delta}',
            up: price.delta >= 0,
          ),
        )
        .toList();

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
            Text(l10n.greeting(farmName), style: text.headlineSmall),
            const SizedBox(height: 4),
            Text(
              '$farmPlace  $farmSize',
              style: text.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.sm),
            LastUpdatedBanner(
              stamp: weather == null
                  ? l10n.weatherNoData
                  : _formatStamp(weather.observedAt),
            ),
            const SizedBox(height: AppSpacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.juniper,
                borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.weather,
                    style: text.labelMedium?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    temperature,
                    style: text.displaySmall?.copyWith(color: Colors.white),
                  ),
                  Text(
                    weatherSummary,
                    style: text.bodyLarge?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      _WeatherStat(label: l10n.humidity, value: humidity),
                      const SizedBox(width: AppSpacing.md),
                      _WeatherStat(label: l10n.rain, value: rainChance),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: KsCard(
                    onTap: () => context.go('/water'),
                    color: const Color(0xFFE8EFE3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          PhosphorIconsRegular.drop,
                          color: AppColors.juniper,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(l10n.groundwater, style: text.titleSmall),
                        const SizedBox(height: 4),
                        Text(
                          MockData.groundwaterStatus,
                          style: text.headlineSmall?.copyWith(
                            color: AppColors.tangerine,
                          ),
                        ),
                        Text(
                          '${l10n.depth} ${MockData.groundwaterDepth}',
                          style: text.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  flex: 6,
                  child: KsCard(
                    onTap: () => context.go('/market'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.marketPrices, style: text.titleSmall),
                        const SizedBox(height: AppSpacing.sm),
                        if (marketRows.isEmpty)
                          Text(
                            l10n.marketNoData,
                            style: text.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          )
                        else
                          ...marketRows
                            .take(2)
                            .map(
                              (row) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        row.crop,
                                        style: text.bodyMedium,
                                      ),
                                    ),
                                    Text(
                                      row.priceLabel,
                                      style: text.titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            KsCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.cropRecs, style: text.titleSmall),
                  const SizedBox(height: AppSpacing.sm),
                  Text(MockData.cropRec, style: text.bodyLarge),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            KsCard(
              onTap: () => context.push('/roadmap'),
              radius: AppSpacing.radiusLg,
              child: Row(
                children: [
                  Icon(
                    PhosphorIconsRegular.calendarBlank,
                    color: AppColors.moss,
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.seeRoadmap, style: text.titleMedium),
                        Text(l10n.thisWeek, style: text.bodySmall),
                      ],
                    ),
                  ),
                  Icon(
                    PhosphorIconsRegular.caretRight,
                    color: AppColors.juniper,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            KsCard(
              onTap: () => context.push('/assistant'),
              radius: AppSpacing.radiusLg,
              color: AppColors.moss,
              child: Row(
                children: [
                  Icon(PhosphorIconsRegular.microphone, color: Colors.white),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      l10n.askAssistant,
                      style: text.titleMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherStat extends StatelessWidget {
  const _WeatherStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.white70),
            ),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
