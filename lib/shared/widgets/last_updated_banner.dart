import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../l10n/app_localizations.dart';

class LastUpdatedBanner extends StatelessWidget {
  const LastUpdatedBanner({super.key, required this.stamp});

  final String stamp;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Icon(PhosphorIconsRegular.cloudArrowDown, size: 16, color: AppColors.juniper),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            '${l10n.lastUpdated} $stamp',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
