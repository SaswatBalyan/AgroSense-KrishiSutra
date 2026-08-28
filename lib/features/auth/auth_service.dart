import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart' as enums;
import 'package:appwrite/models.dart' as models;

import '../../data/remote/appwrite_services.dart';

class AuthService {
  const AuthService(this.services);

  final AppwriteServices services;

  /// Deep link the Appwrite OAuth2 flow redirects back to after consent.
  /// Must match the intent-filter registered in AndroidManifest.xml.
  static const oauthCallbackUrl = 'ks-auth://callback';

  Future<models.User?> currentUser() async {
    if (!services.isReady) return null;
    try {
      return await services.account.get();
    } on AppwriteException {
      return null;
    }
  }

  Future<models.Token> sendPhoneOtp(String phone) {
    if (!services.isReady) {
      throw StateError('Appwrite authentication is not configured.');
    }
    return services.account.createPhoneToken(userId: 'unique()', phone: phone);
  }

  Future<models.Session> verifyPhoneOtp({
    required String userId,
    required String secret,
  }) {
    if (!services.isReady) {
      throw StateError('Appwrite authentication is not configured.');
    }
    return services.account.updatePhoneSession(userId: userId, secret: secret);
  }

  /// Opens the Google OAuth2 consent screen in a browser tab and waits for
  /// Appwrite to redirect back into the app via the [oauthCallbackUrl] deep
  /// link. The resulting Appwrite session is persisted by the SDK.
  Future<void> signInWithGoogle() {
    if (!services.isReady) {
      throw StateError('Appwrite authentication is not configured.');
    }
    return services.account.createOAuth2Session(
      provider: enums.OAuthProvider.google,
      success: AuthService.oauthCallbackUrl,
    );
  }

  Future<void> logout() async {
    if (services.isReady) {
      await services.account.deleteSession(sessionId: 'current');
    }
  }
}
