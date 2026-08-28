import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:appwrite/models.dart' as models;
import '../../features/ai_assistant/ai_assistant_screen.dart';
import '../../features/auth/auth_provider.dart';
import '../../features/auth/login_screen.dart';
import '../../features/auth/otp_verify_screen.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/marketplace/marketplace_screen.dart';
import '../../features/marketplace/product_detail_screen.dart';
import '../../features/onboarding/farm_profile_screen.dart';
import '../../features/onboarding/language_select_screen.dart';
import '../../features/pocket_scientist/pocket_scientist_screen.dart';
import '../../features/roadmap/roadmap_screen.dart';
import '../../features/water_compass/water_compass_screen.dart';
import '../../data/remote/remote_providers.dart';
import '../../shared/providers/onboarding_provider.dart';
import 'scaffold_with_nav_bar.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final shellNavigatorWaterKey = GlobalKey<NavigatorState>(debugLabel: 'water');
final shellNavigatorScientistKey = GlobalKey<NavigatorState>(
  debugLabel: 'scientist',
);
final shellNavigatorMarketKey = GlobalKey<NavigatorState>(debugLabel: 'market');

class _RouterRefresh extends ChangeNotifier {
  _RouterRefresh(Ref ref) {
    ref.listen<bool>(onboardingCompleteProvider, (_, _) => notifyListeners());
    ref.listen(authStateProvider, (_, _) => notifyListeners());
    ref.listen<bool>(loginSkippedProvider, (_, _) => notifyListeners());
  }
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final refresh = _RouterRefresh(ref);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: '/login',
    navigatorKey: rootNavigatorKey,
    refreshListenable: refresh,
    redirect: (context, state) {
      final done = ref.read(onboardingCompleteProvider);
      final configured = ref.read(appwriteServicesProvider).isReady;
      final auth = ref.read(authStateProvider);
      final onboarding = state.matchedLocation.startsWith('/onboarding');
      final login = state.matchedLocation.startsWith('/login');

      if (configured && auth.isLoading) return null;
      final skipped = ref.read(loginSkippedProvider);
      if (configured && auth.valueOrNull == null && !login && !skipped) {
        return '/login';
      }
      if (configured && auth.valueOrNull != null && login) {
        return done ? '/home' : '/onboarding';
      }
      if (!done && !onboarding && (!login || skipped)) return '/onboarding';
      if (done && onboarding) return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            path: 'verify',
            builder: (context, state) {
              final token = state.extra;
              if (token is! models.Token) return const LoginScreen();
              return OtpVerifyScreen(token: token);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const LanguageSelectScreen(),
        routes: [
          GoRoute(
            path: 'farm',
            builder: (context, state) => const FarmProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/roadmap',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const RoadmapScreen(),
      ),
      GoRoute(
        path: '/assistant',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const AiAssistantScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorWaterKey,
            routes: [
              GoRoute(
                path: '/water',
                builder: (context, state) => const WaterCompassScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorScientistKey,
            routes: [
              GoRoute(
                path: '/scientist',
                builder: (context, state) => const PocketScientistScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorMarketKey,
            routes: [
              GoRoute(
                path: '/market',
                builder: (context, state) => const MarketplaceScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => ProductDetailScreen(
                      productId: state.pathParameters['id']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
