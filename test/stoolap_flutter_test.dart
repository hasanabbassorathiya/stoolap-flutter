import 'package:flutter_test/flutter_test.dart';
import 'package:stoolap_flutter/stoolap_flutter.dart';
import 'package:stoolap_flutter/src/rust/api/db.dart'; // Import to access specific types

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
      await db.execute('CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, val TEXT)');

      // Create: use NULL for auto-increment
      await db.execute('INSERT INTO test (id, val) VALUES (?, ?)', params: [null, 'hello']);

      // Read
      final results = await db.query('SELECT * FROM test');
      expect(results.length, 1);
      // Access value using type checking for freezed types
      final row = results.first;
      expect((row.values[1] as StoolapValue_Text).field0, 'hello');

      // Update
      await db.execute('UPDATE test SET val = ? WHERE id = ?', params: ['world', 1]);
      final updated = await db.query('SELECT val FROM test WHERE id = 1');
      expect((updated.first.values[0] as StoolapValue_Text).field0, 'world');

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

      expect((row.values[0] as StoolapValue_Integer).field0, 42);
      expect((row.values[1] as StoolapValue_Float).field0, 3.14);
      expect((row.values[2] as StoolapValue_Boolean).field0, true);
    });

    test('Transactions & Savepoints', () async {
      await db.execute('CREATE TABLE tx_test (id INTEGER PRIMARY KEY AUTOINCREMENT)');

      await db.begin();
      await db.execute('INSERT INTO tx_test (id) VALUES (?)', params: [1]);
      await db.savepoint('s1');
      await db.execute('INSERT INTO tx_test (id) VALUES (?)', params: [2]);
      await db.rollbackTo('s1'); // Undo 2
      await db.commit(); // Commit 1

      final results = await db.query('SELECT * FROM tx_test');
      expect(results.length, 1);
      expect((results.first.values[0] as StoolapValue_Integer).field0, 1);
    });

    test('Schema Inspection', () async {
      await db.execute('CREATE TABLE schema_test (id INTEGER PRIMARY KEY AUTOINCREMENT)');
      final tables = await db.tables();
      expect(tables.contains('schema_test'), true);
    });

    test('Unicode Case Insensitivity', () async {
      await db.execute('CREATE TABLE uni (val TEXT)');
      await db.execute('INSERT INTO uni (val) VALUES (?)', params: ['Ñame']);

      // Case-insensitive search using COLLATE() function
      final results = await db.query(
        "SELECT * FROM uni WHERE COLLATE(val, 'NOCASE') = COLLATE(?, 'NOCASE')",
        params: ['ñame'],
      );
      expect(results.length, 1);
      expect((results.first.values[0] as StoolapValue_Text).field0, 'Ñame');
    });
  });
}
