import 'package:flutter_test/flutter_test.dart';
import 'package:stoolap_flutter/stoolap_flutter.dart';

void main() {
  test('Debug Stoolap', () async {
    await StoolapDatabase.init();
    final db = StoolapDatabase();
    await db.open(':memory:');
    
    // Test Schema
    await db.execute('CREATE TABLE debug_table (id INTEGER PRIMARY KEY)');
    final tables = await db.query("SHOW TABLES");
    print('Tables: $tables');
    
    // Test Unicode LIKE
    await db.execute('CREATE TABLE uni (val TEXT)');
    await db.execute('INSERT INTO uni (val) VALUES (?)', params: ['Ñame']);
    final results = await db.query('SELECT * FROM uni WHERE val LIKE ?', params: ['ñame']);
    print('Unicode search results: $results');
    
    await db.close();
  });
}
