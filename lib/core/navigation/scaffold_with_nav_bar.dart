import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../theme/app_colors.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        height: 72,
        backgroundColor: AppColors.card,
        indicatorColor: AppColors.juniper.withValues(alpha: 0.35),
        destinations: [
          NavigationDestination(
            icon: Icon(PhosphorIconsRegular.house, size: 28),
            selectedIcon: Icon(PhosphorIconsFill.house, size: 28, color: AppColors.juniper),
            label: l10n.dashboard,
          ),
          NavigationDestination(
            icon: Icon(PhosphorIconsRegular.drop, size: 28),
            selectedIcon: Icon(PhosphorIconsFill.drop, size: 28, color: AppColors.juniper),
            label: l10n.waterCompass,
          ),
          NavigationDestination(
            icon: Icon(PhosphorIconsRegular.plant, size: 28),
            selectedIcon: Icon(PhosphorIconsFill.plant, size: 28, color: AppColors.juniper),
            label: l10n.pocketScientist,
          ),
          NavigationDestination(
            icon: Icon(PhosphorIconsRegular.storefront, size: 28),
            selectedIcon: Icon(PhosphorIconsFill.storefront, size: 28, color: AppColors.juniper),
            label: l10n.marketplace,
          ),
        ],
      ),
    );
  }
}
