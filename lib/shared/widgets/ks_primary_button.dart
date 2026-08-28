import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';

class KsPrimaryButton extends StatelessWidget {
  const KsPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final child = icon == null
        ? Text(label)
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 22),
              const SizedBox(width: AppSpacing.sm),
              Text(label),
            ],
          );

    return SizedBox(
      width: expand ? double.infinity : null,
      height: AppSpacing.minTouch + 8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.moss,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.sage,
        ),
        child: child,
      ),
    );
  }
}
