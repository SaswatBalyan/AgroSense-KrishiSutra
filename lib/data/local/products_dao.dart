import 'package:drift/drift.dart';

import 'app_database.dart';

part 'products_dao.g.dart';

@DriftAccessor(tables: [Products])
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.attachedDatabase);

  Stream<List<Product>> watchAll() {
    return (select(products)..orderBy([(p) => OrderingTerm.asc(p.id)])).watch();
  }

  Future<Product?> getById(int id) {
    return (select(products)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  Future<bool> isEmpty() async {
    final count = await products.count().getSingle();
    return count == 0;
  }

  /// Replaces the catalog while carrying over remote ids by name so a
  /// re-seed does not break remote reconciliation for existing rows.
  Future<void> replaceAll(List<ProductsCompanion> rows) {
    return transaction(() async {
      await delete(products).go();
      await batch((batch) => batch.insertAll(products, rows));
    });
  }
}
