import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/widgets/ks_card.dart';
import 'marketplace_provider.dart';

class MarketplaceScreen extends ConsumerWidget {
  const MarketplaceScreen({super.key});

  static const _categories = ['Seed', 'Soil', 'Water', 'Nutrient'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final text = Theme.of(context).textTheme;
    final filter = ref.watch(marketplaceFilterProvider);
    final products = ref.watch(filteredProductsProvider);

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
            Text(l10n.marketplace, style: text.headlineSmall),
            const SizedBox(height: AppSpacing.md),
            TextField(
              onChanged: (value) =>
                  ref.read(marketplaceFilterProvider.notifier).setQuery(value),
              decoration: InputDecoration(
                hintText: l10n.searchInputs,
                prefixIcon: Icon(PhosphorIconsRegular.magnifyingGlass),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final category in _categories)
                    Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: FilterChip(
                        label: Text(category),
                        selected: filter.category == category,
                        onSelected: (selected) => ref
                            .read(marketplaceFilterProvider.notifier)
                            .setCategory(selected ? category : null),
                        selectedColor: AppColors.sage,
                        showCheckmark: false,
                        backgroundColor: AppColors.card,
                        side: const BorderSide(color: AppColors.hairline),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            if (products.isEmpty)
              KsCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  child: Center(
                    child: Text(
                      l10n.marketNoData,
                      style: text.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              )
            else
              ...products.map(
                (product) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: KsCard(
                    onTap: () => context.push('/market/${product.id}'),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.dawn,
                            borderRadius:
                                BorderRadius.circular(AppSpacing.radiusSm),
                          ),
                          child: Icon(
                            PhosphorIconsRegular.package,
                            color: AppColors.juniper,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name, style: text.titleMedium),
                              Text(
                                product.seller,
                                style: text.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        Text(product.priceLabel, style: text.titleSmall),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
