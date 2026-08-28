import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/local/products_dao.dart';
import '../../shared/providers/database_provider.dart';

final productsDaoProvider = Provider<ProductsDao>(
  (ref) => ProductsDao(ref.watch(databaseProvider)),
);

/// Marketplace listing state: search text + selected category filter
/// (null = all categories).
class MarketplaceFilter {
  const MarketplaceFilter({this.query = '', this.category});

  final String query;
  final String? category;

  MarketplaceFilter copyWith({String? query, String? category}) =>
      MarketplaceFilter(
        query: query ?? this.query,
        category: category ?? this.category,
      );

  bool matches(Product product) {
    final matchesCategory =
        category == null || product.category == category;
    final q = query.trim().toLowerCase();
    final matchesQuery = q.isEmpty ||
        product.name.toLowerCase().contains(q) ||
        product.seller.toLowerCase().contains(q);
    return matchesCategory && matchesQuery;
  }
}

class MarketplaceFilterController extends Notifier<MarketplaceFilter> {
  @override
  MarketplaceFilter build() => const MarketplaceFilter();

  void setQuery(String query) => state = state.copyWith(query: query);

  void setCategory(String? category) => state = state.copyWith(category: category);
}

final marketplaceFilterProvider =
    NotifierProvider<MarketplaceFilterController, MarketplaceFilter>(
  MarketplaceFilterController.new,
);

/// Seeds the demo catalog once (first marketplace entry) so retailers have a
/// starting inventory; Appwrite pulls replace/extend it afterwards.
final _seedCatalog = <ProductsCompanion>[
  ProductsCompanion.insert(
    remoteId: Value('seed-neem'),
    name: 'Neem cake 25 kg',
    seller: 'Nashik Agro Mart',
    priceLabel: 'Rs 487',
    category: 'Soil',
    detail:
        'Cold-pressed cake for kharif beds. Mix 80-100 kg per hectare before sowing. Local stock, Sinnar road.',
    updatedAt: DateTime(2026, 8, 1),
  ),
  ProductsCompanion.insert(
    remoteId: Value('seed-drip'),
    name: 'Drip tape 100 m',
    seller: 'Jaldoot Irrigation',
    priceLabel: 'Rs 1,120',
    category: 'Water',
    detail:
        '16 mm tape, 30 cm dripper spacing. Fits a 0.4 ha vegetable strip. Pickup from Ozar.',
    updatedAt: DateTime(2026, 8, 1),
  ),
  ProductsCompanion.insert(
    remoteId: Value('seed-soybean'),
    name: 'Soybean JS-335',
    seller: 'District seed farm',
    priceLabel: 'Rs 92 /kg',
    category: 'Seed',
    detail:
        'Certified lot, 2026 kharif. Treat with rhizobium before sowing. 75 kg per hectare.',
    updatedAt: DateTime(2026, 8, 1),
  ),
  ProductsCompanion.insert(
    remoteId: Value('seed-urea'),
    name: 'Urea 45 kg bag',
    seller: 'FPO desk, Sinnar',
    priceLabel: 'Rs 266',
    category: 'Nutrient',
    detail:
        'Cooperative rate this week. Split dose after first irrigation. Carry ID for the subsidy slip.',
    updatedAt: DateTime(2026, 8, 1),
  ),
];

final marketplaceProductsProvider = StreamProvider<List<Product>>((ref) {
  // Seed once if the catalog is empty (demo data); live Appwrite pulls will
  // overwrite/extend these rows through the normal sync engine.
  unawaited(() async {
    final dao = ref.read(productsDaoProvider);
    if (await dao.isEmpty()) {
      await dao.replaceAll(_seedCatalog);
    }
  }());

  return ref.watch(productsDaoProvider).watchAll();
});

final filteredProductsProvider = Provider<List<Product>>((ref) {
  final filter = ref.watch(marketplaceFilterProvider);
  final products = ref.watch(marketplaceProductsProvider).valueOrNull;
  return (products ?? const []).where(filter.matches).toList();
});
