import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/providers/locale_provider.dart';
import '../../shared/widgets/ks_primary_button.dart';

class LanguageSelectScreen extends ConsumerWidget {
  const LanguageSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selected = ref.watch(localeProvider);
    final options = [
      (const Locale('en'), l10n.english, 'EN'),
      (const Locale('hi'), l10n.hindi, 'HI'),
      (const Locale('bn'), l10n.bengali, 'BN'),
      (const Locale('ta'), l10n.tamil, 'TA'),
      (const Locale('te'), l10n.telugu, 'TE'),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenMargin,
            AppSpacing.lg,
            AppSpacing.screenMargin,
            AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.appTitle,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: AppColors.juniper),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                l10n.chooseLanguage,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                l10n.languageHint,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.lg),
              Expanded(
                child: ListView.separated(
                  itemCount: options.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final option = options[index];
                    final isSelected =
                        selected.languageCode == option.$1.languageCode;
                    return InkWell(
                      onTap: () =>
                          ref.read(localeProvider.notifier).state = option.$1,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeOutCubic,
                        constraints: const BoxConstraints(
                          minHeight: AppSpacing.minTouch,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.md,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.juniper
                              : AppColors.card,
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusMd,
                          ),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.juniper
                                : AppColors.hairline,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white.withValues(alpha: 0.12)
                                    : AppColors.dawn,
                                borderRadius: BorderRadius.circular(
                                  AppSpacing.radiusSm,
                                ),
                              ),
                              child: Text(
                                option.$3,
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.juniper,
                                    ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.md),
                            Expanded(
                              child: Text(
                                option.$2,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.textPrimary,
                                    ),
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                PhosphorIconsFill.checkCircle,
                                color: AppColors.tangerine,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              KsPrimaryButton(
                label: l10n.continueLabel,
                onPressed: () => context.go('/onboarding/farm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
