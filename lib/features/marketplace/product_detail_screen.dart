import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/widgets/ks_primary_button.dart';
import 'marketplace_provider.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final text = Theme.of(context).textTheme;
    final products = ref.watch(marketplaceProductsProvider).valueOrNull ?? const [];
    final product = products.where((item) => item.id.toString() == productId).firstOrNull;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.productDetail)),
        body: Center(
          child: Text(
            l10n.marketNoData,
            style: text.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.productDetail)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenMargin,
            AppSpacing.md,
            AppSpacing.screenMargin,
            AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: AppColors.juniper,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                ),
                alignment: Alignment.center,
                child: Text(
                  product.category,
                  style: text.labelLarge?.copyWith(color: Colors.white70),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(product.category, style: text.labelMedium?.copyWith(color: AppColors.moss)),
              Text(product.name, style: text.headlineSmall),
              const SizedBox(height: 4),
              Text(product.seller, style: text.bodyMedium?.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: AppSpacing.md),
              Text(product.priceLabel, style: text.headlineMedium),
              const SizedBox(height: AppSpacing.md),
              Text(product.detail, style: text.bodyLarge),
              const Spacer(),
              KsPrimaryButton(label: l10n.addToBag, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
