class AppwriteConfig {
  const AppwriteConfig({
    required this.endpoint,
    required this.projectId,
    required this.databaseId,
    required this.farmCollectionId,
    required this.diagnosisCollectionId,
    required this.marketPriceCollectionId,
    required this.weatherCollectionId,
    required this.roadmapTaskCollectionId,
    required this.chatMessageCollectionId,
    this.productCollectionId = '',
  });

  factory AppwriteConfig.fromEnvironment() {
    return const AppwriteConfig(
      endpoint: String.fromEnvironment('APPWRITE_ENDPOINT'),
      projectId: String.fromEnvironment('APPWRITE_PROJECT_ID'),
      databaseId: String.fromEnvironment('APPWRITE_DATABASE_ID'),
      farmCollectionId: String.fromEnvironment('APPWRITE_FARM_COLLECTION_ID'),
      diagnosisCollectionId: String.fromEnvironment(
        'APPWRITE_DIAGNOSIS_COLLECTION_ID',
      ),
      marketPriceCollectionId: String.fromEnvironment(
        'APPWRITE_MARKET_PRICE_COLLECTION_ID',
      ),
      weatherCollectionId: String.fromEnvironment(
        'APPWRITE_WEATHER_COLLECTION_ID',
      ),
      roadmapTaskCollectionId: String.fromEnvironment(
        'APPWRITE_ROADMAP_TASK_COLLECTION_ID',
      ),
      chatMessageCollectionId: String.fromEnvironment(
        'APPWRITE_CHAT_MESSAGE_COLLECTION_ID',
      ),
      productCollectionId: String.fromEnvironment(
        'APPWRITE_PRODUCT_COLLECTION_ID',
      ),
    );
  }

  final String endpoint;
  final String projectId;
  final String databaseId;
  final String farmCollectionId;
  final String diagnosisCollectionId;
  final String marketPriceCollectionId;
  final String weatherCollectionId;
  final String roadmapTaskCollectionId;
  final String chatMessageCollectionId;
  final String productCollectionId;

  bool get isConfigured =>
      endpoint.isNotEmpty && projectId.isNotEmpty && databaseId.isNotEmpty;

  String? collectionIdFor(String entity) {
    final collectionId = switch (entity) {
      'farm' => farmCollectionId,
      'diagnosis' => diagnosisCollectionId,
      'market_price' => marketPriceCollectionId,
      'weather' => weatherCollectionId,
      'roadmap_task' => roadmapTaskCollectionId,
      'chat_message' => chatMessageCollectionId,
      'product' => productCollectionId,
      _ => null,
    };
    return collectionId == null || collectionId.isEmpty ? null : collectionId;
  }
}
