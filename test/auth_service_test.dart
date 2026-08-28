import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/data/remote/appwrite_config.dart';
import 'package:krishi_sutra/data/remote/appwrite_services.dart';
import 'package:krishi_sutra/features/auth/auth_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const config = AppwriteConfig(
    endpoint: '',
    projectId: '',
    databaseId: '',
    farmCollectionId: '',
    diagnosisCollectionId: '',
    marketPriceCollectionId: '',
    weatherCollectionId: '',
    roadmapTaskCollectionId: '',
    chatMessageCollectionId: '',
  );

  test('unconfigured auth stays offline-safe', () async {
    final service = AuthService(AppwriteServices(config));

    expect(await service.currentUser(), isNull);
    expect(
      () => service.sendPhoneOtp('+919876543210'),
      throwsA(isA<StateError>()),
    );
    expect(
      () => service.signInWithGoogle(),
      throwsA(isA<StateError>()),
    );
  });
}
