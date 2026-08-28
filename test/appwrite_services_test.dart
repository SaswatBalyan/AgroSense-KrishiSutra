import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/data/remote/appwrite_config.dart';
import 'package:krishi_sutra/data/remote/appwrite_services.dart';

void main() {
  testWidgets('unconfigured services stay offline-safe', (_) async {
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

    final services = AppwriteServices(config);

    expect(services.isReady, isFalse);
  });
}
