import 'package:appwrite/models.dart' as models;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/remote/remote_providers.dart';
import 'auth_service.dart';

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(ref.watch(appwriteServicesProvider)),
);

final authStateProvider = FutureProvider<models.User?>((ref) {
  return ref.watch(authServiceProvider).currentUser();
});

/// Set when the user chooses "Skip for now" on the login screen — lets the
/// demo run without a cloud session even when Appwrite is configured.
final loginSkippedProvider = StateProvider<bool>((ref) => false);
