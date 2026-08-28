import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/data/local/app_database.dart';
import 'package:krishi_sutra/data/local/products_dao.dart';

void main() {
  late AppDatabase database;
  late ProductsDao dao;

  setUp(() {
    database = AppDatabase.forTesting();
    dao = ProductsDao(database);
  });

  tearDown(() => database.close());

  ProductsCompanion product(String name, {String category = 'Seed'}) {
    return ProductsCompanion.insert(
      remoteId: Value('remote-$name'),
      name: name,
      seller: 'Test seller',
      priceLabel: 'Rs 100',
      category: category,
      detail: 'Test detail for $name.',
      updatedAt: DateTime(2026, 8, 26),
    );
  }

  test('isEmpty reflects catalog state', () async {
    expect(await dao.isEmpty(), isTrue);
    await dao.replaceAll([product('Neem cake')]);
    expect(await dao.isEmpty(), isFalse);
  });

  test('replaceAll swaps the catalog', () async {
    await dao.replaceAll([product('Old item', category: 'Water')]);
    await dao.replaceAll([product('New item'), product('Other item')]);

    final rows = await dao.watchAll().first;
    expect(rows, hasLength(2));
    expect(rows.map((r) => r.name), containsAll(['New item', 'Other item']));
  });

  test('getById returns the matching product', () async {
    await dao.replaceAll([product('Neem cake'), product('Drip tape')]);
    final rows = await dao.watchAll().first;

    final found = await dao.getById(rows[1].id);
    expect(found, isNotNull);
    expect(found!.name, rows[1].name);
  });
}
