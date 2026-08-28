import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';

class KrishiLogo extends StatelessWidget {
  const KrishiLogo({super.key, this.showWordmark = true});

  final bool showWordmark;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final mark = ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Image.asset(
        'assets/logo.jpeg',
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      ),
    );

    if (!showWordmark) return mark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        mark,
        const SizedBox(width: AppSpacing.sm),
        Text(
          'Krishi-Sutra',
          style: text.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
