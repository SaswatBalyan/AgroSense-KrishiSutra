import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_colors.dart';
import 'core/navigation/app_router.dart';
import 'shared/widgets/krishi_logo.dart';
import 'l10n/app_localizations.dart';
import 'shared/providers/locale_provider.dart';
import 'data/remote/remote_providers.dart';

class KrishiSutraApp extends ConsumerWidget {
  const KrishiSutraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final locale = ref.watch(localeProvider);
    ref.watch(syncSchedulerProvider);

    return _LaunchOverlay(
      child: MaterialApp.router(
        title: 'Krishi-Sutra',
        theme: AppTheme.lightTheme,
        routerConfig: router,
        locale: locale,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

class _LaunchOverlay extends StatefulWidget {
  const _LaunchOverlay({required this.child});

  final Widget child;

  @override
  State<_LaunchOverlay> createState() => _LaunchOverlayState();
}

class _LaunchOverlayState extends State<_LaunchOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _logoController;
  Timer? _dismissTimer;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    )..forward();
    _dismissAfterEntrance();
  }

  void _dismissAfterEntrance() {
    _dismissTimer = Timer(const Duration(milliseconds: 1250), () {
      if (mounted) setState(() => _visible = false);
    });
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        fit: StackFit.expand,
        children: [
          widget.child,
          IgnorePointer(
            ignoring: !_visible,
            child: AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeOut,
              child: ColoredBox(
                color: AppColors.background,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _logoController,
                    builder: (context, child) {
                      final scale = Tween<double>(
                        begin: 0.82,
                        end: 1,
                      ).evaluate(
                        CurvedAnimation(
                          parent: _logoController,
                          curve: Curves.easeOutBack,
                        ),
                      );
                      return Transform.scale(scale: scale, child: child);
                    },
                    child: const KrishiLogo(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
