import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';

class KsCard extends StatelessWidget {
  const KsCard({
    super.key,
    required this.child,
    this.color = AppColors.card,
    this.padding,
    this.onTap,
    this.radius = AppSpacing.radiusMd,
  });

  final Widget child;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final body = Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.hairline),
      ),
      child: child,
    );

    if (onTap == null) return body;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: body,
      ),
    );
  }
}
