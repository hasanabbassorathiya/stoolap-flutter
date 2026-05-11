import 'package:flutter_test/flutter_test.dart';
import 'package:stoolap_flutter/stoolap_flutter.dart';

void main() {
  group('StoolapDatabase Integration', () {
    late StoolapDatabase db;

    setUpAll(() async {
      await StoolapDatabase.init();
    });

    setUp(() async {
      db = StoolapDatabase();
      await db.open(':memory:'); // Use in-memory for fast tests
    });

    tearDown(() async {
      await db.close();
    });

    test('Core CRUD Operations', () async {
      await db.execute('CREATE TABLE test (id INTEGER PRIMARY KEY, val TEXT)');

      // Create
      await db.execute('INSERT INTO test (val) VALUES (?)', params: ['hello']);

      // Read
      final results = await db.query('SELECT * FROM test');
      expect(results.length, 1);
      expect(results.first.values[1].toString(), 'hello');

      // Update
      await db.execute('UPDATE test SET val = ? WHERE id = ?', params: ['world', 1]);
      final updated = await db.query('SELECT val FROM test WHERE id = 1');
      expect(updated.first.values[0].toString(), 'world');

      // Delete
      await db.execute('DELETE FROM test WHERE id = 1');
      final deleted = await db.query('SELECT * FROM test');
      expect(deleted.isEmpty, true);
    });

    test('Type-Safe Parameters', () async {
      await db.execute('CREATE TABLE types (i INTEGER, f FLOAT, b BOOLEAN)');
      await db.execute(
        'INSERT INTO types VALUES (?, ?, ?)',
        params: [42, 3.14, true],
      );

      final results = await db.query('SELECT * FROM types');
      final row = results.first;
      // Note: Map specific enum cases from generated bindings
      expect(row.values[0].toString(), contains('42'));
      expect(row.values[1].toString(), contains('3.14'));
      expect(row.values[2].toString(), contains('true'));
    });

    test('Transactions & Savepoints', () async {
      await db.execute('CREATE TABLE tx_test (id INTEGER)');

      await db.begin();
      await db.execute('INSERT INTO tx_test VALUES (1)');
      await db.savepoint('s1');
      await db.execute('INSERT INTO tx_test VALUES (2)');
      await db.rollbackTo('s1'); // Undo 2
      await db.commit(); // Commit 1

      final results = await db.query('SELECT * FROM tx_test');
      expect(results.length, 1);
      expect(results.first.values[0].toString(), '1');
    });

    test('Schema Inspection', () async {
      await db.execute('CREATE TABLE schema_test (id INTEGER)');
      final tables = await db.tables();
      expect(tables.contains('schema_test'), true);
    });
  });
}
