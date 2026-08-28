import 'package:appwrite/appwrite.dart';

import 'appwrite_config.dart';

class AppwriteServices {
  AppwriteServices(this.config)
    : client = _client(config),
      account = Account(_client(config)),
      databases = Databases(_client(config)),
      storage = Storage(_client(config));

  final AppwriteConfig config;
  final Client client;
  final Account account;
  final Databases databases;
  final Storage storage;

  bool get isReady => config.isConfigured;

  static Client _client(AppwriteConfig config) {
    return Client()
        .setEndpoint(
          config.endpoint.isEmpty
              ? 'https://cloud.appwrite.io/v1'
              : config.endpoint,
        )
        .setProject(config.projectId);
  }
}
