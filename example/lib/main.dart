import 'package:flutter/material.dart';
import 'package:stoolap_flutter/stoolap_flutter.dart';

/// Stoolap Flutter SDK Example
///
/// This example demonstrates every major feature of the Stoolap SDK:
/// 1. Initialization & Instance Management
/// 2. Basic CRUD Operations (Type-Safe Parameters)
/// 3. MVCC Transactions & Savepoints
/// 4. Handle Cloning for Independent Transactions
/// 5. High-Throughput Batch Execution
/// 6. Native Vector Search & HNSW Indexing
/// 7. Native JSON Support
/// 8. Engine Tuning via Pragmas
/// 9. Query Profiling via EXPLAIN
/// 10. Schema Inspection
/// 11. Reactive "Live" Queries with Streams
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FEATURE: Initialization
  // Initialize the bridge once at app startup.
  await StoolapDatabase.init();

  runApp(const StoolapExampleApp());
}

class StoolapExampleApp extends StatelessWidget {
  const StoolapExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stoolap SDK Showcase',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const StoolapShowcasePage(),
    );
  }
}

class StoolapShowcasePage extends StatefulWidget {
  const StoolapShowcasePage({super.key});

  @override
  State<StoolapShowcasePage> createState() => _StoolapShowcasePageState();
}

class _StoolapShowcasePageState extends State<StoolapShowcasePage> {
  final StoolapDatabase _db = StoolapDatabase();
  bool _isInitialized = false;
  String _status = "Initializing...";
  final List<String> _logs = [];

  @override
  void initState() {
    super.initState();
    _setupDatabase();
    _listenToLogs();
  }

  // FEATURE: Initialization & Logging
  // Subscribe to internal Rust engine events for debugging and observability.
  void _listenToLogs() {
    _db.watchLogs().listen((log) {
      if (mounted) {
        setState(() => _logs.add("[RUST] $log"));
      }
    });
  }

  Future<void> _setupDatabase() async {
    try {
      // FEATURE: Instance Management
      // Create a dedicated database instance for this page.
      await _db.open('showcase.db');

      // FEATURE: Handle Cloning
      // Each clone has independent transaction state but shared data.
      final backgroundDb = await _db.clone();
      debugPrint('Background clone created: $backgroundDb');

      // FEATURE: Basic SQL Execution
      // Create tables for our different features
      await _db.execute('CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY, content TEXT, category TEXT)');
      await _db.execute('CREATE TABLE IF NOT EXISTS metadata (id INTEGER PRIMARY KEY, data JSON)');

      // FEATURE: Vector Search Setup
      // Stoolap supports native VECTOR types. Here we use a 384-dim vector for semantic search.
      await _db.execute('''
        CREATE TABLE IF NOT EXISTS embeddings (
          id INTEGER PRIMARY KEY,
          text TEXT,
          vec VECTOR(384)
        )
      ''');

      // Create an HNSW index for sub-linear search speed.
      // HNSW is the state-of-the-art algorithm for approximate nearest neighbor search.
      await _db.execute('''
        CREATE INDEX IF NOT EXISTS idx_hnsw_vec ON embeddings(vec)
        USING HNSW WITH (metric = 'cosine')
      ''');

      setState(() {
        _isInitialized = true;
        _status = "Stoolap Ready!";
      });
    } catch (e) {
      setState(() => _status = "Error: $e");
    }
  }

  Future<void> _addNote() async {
    await _db.execute(
      'INSERT INTO notes (content, category) VALUES (?, ?)',
      params: ['Note created at ${DateTime.now()}', 'General'],
    );
  }

  // FEATURE: Batch Execution
  // Execute multiple SQL commands efficiently in a single FFI call.
  Future<void> _runBatch() async {
    await _db.batchExecute([
      "INSERT INTO notes (content, category) VALUES ('Batch 1', 'Work')",
      "INSERT INTO notes (content, category) VALUES ('Batch 2', 'Personal')",
    ]);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Batch Executed Successfully'),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
    ));
  }

  // FEATURE: Schema Inspection
  // Inspect existing tables and database metadata.
  Future<void> _showTables() async {
    final tables = await _db.tables();
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Database Tables'),
        content: Text(tables.join('\n')),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
      ),
    );
  }

  // FEATURE: MVCC Transactions & Savepoints
  // Atomic multi-step operations with fine-grained rollback control.
  Future<void> _runTransaction() async {
    await _db.begin();
    try {
      await _db.execute('INSERT INTO notes (content) VALUES (?)', params: ['Tx Step 1']);

      // Create a savepoint
      await _db.savepoint('sp1');
      await _db.execute('INSERT INTO notes (content) VALUES (?)', params: ['Tx Step 2 (will be rolled back)']);

      // Roll back to savepoint (Step 2 is undone, Step 1 remains)
      await _db.rollbackTo('sp1');

      await _db.execute('INSERT INTO notes (content) VALUES (?)', params: ['Tx Step 3']);
      await _db.commit();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Transaction Committed (Steps 1 & 3 applied)'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ));
    } catch (e) {
      await _db.rollback();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Transaction Failed & Rolled Back: $e'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ));
    }
  }

  // FEATURE: Native JSON Support
  // Stoolap supports native JSON columns for flexible schema-less data.
  Future<void> _jsonDemo() async {
    final jsonData = '{"user": "Alice", "settings": {"theme": "dark", "notifications": true}}';
    await _db.execute('INSERT INTO metadata (data) VALUES (?)', params: [jsonData]);

    final results = await _db.query('SELECT data FROM metadata ORDER BY id DESC LIMIT 1');
    if (results.isNotEmpty) {
      final data = results.first.values[0];
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Retrieved JSON: $data'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ));
    }
  }

  // FEATURE: Native Vector Search
  // We use the built-in EMBED() function which converts text to vectors inside Rust.
  // No external API calls are needed for semantic search!
  Future<void> _semanticSearch() async {
    final query = "database performance";
    // Seed some data first
    await _db.execute('INSERT INTO embeddings (text, vec) VALUES (?, EMBED(?))', params: ['SQLite is slow', 'SQLite is slow']);
    await _db.execute('INSERT INTO embeddings (text, vec) VALUES (?, EMBED(?))', params: ['Stoolap is fast', 'Stoolap is fast']);

    final results = await _db.query('''
      SELECT text, VEC_DISTANCE_COSINE(vec, EMBED(?)) as dist
      FROM embeddings
      ORDER BY dist ASC
      LIMIT 1
    ''', params: [query]);

    if (results.isNotEmpty) {
      final topMatch = results.first.values[0]; // text column
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Top Semantic Match: $topMatch'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ));
    }
  }

  // FEATURE: Advanced SQL (CTEs)
  // Demonstrate hierarchical queries using Common Table Expressions.
  Future<void> _runRecursiveCTE() async {
    final results = await _db.query('''
      WITH RECURSIVE counters(n) AS (
        SELECT 1
        UNION ALL
        SELECT n + 1 FROM counters WHERE n < 5
      )
      SELECT n FROM counters
    ''');

    final output = results.map((r) => r.values[0]).join(', ');
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Recursive CTE output: $output'),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ));
  }

  // FEATURE: Query Profiling via EXPLAIN
  // Use EXPLAIN ANALYZE to inspect how the Stoolap optimizer plans and executes your query.
  Future<void> _explainQuery() async {
    final plan = await _db.explain('SELECT * FROM notes WHERE category = ?', params: ['General']);
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Query Plan'),
        content: SingleChildScrollView(child: Text(plan, style: const TextStyle(fontFamily: 'monospace', fontSize: 12))),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
      ),
    );
  }

  // FEATURE: Mutations with RETURNING
  // Perform an insert and get the generated values back in a single atomic step.
  Future<void> _addAndReturn() async {
    final results = await _db.executeWithResults(
      'INSERT INTO notes (content, category) VALUES (?, ?) RETURNING id, content',
      params: ['Returned note', 'Analytics'],
    );
    if (results.isNotEmpty) {
      final id = results.first.values[0];
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Inserted with ID: $id'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ));
    }
  }

  // FEATURE: Unicode Handling
  // Stoolap supports custom collations for case-insensitive Unicode searches.
  Future<void> _unicodeDemo() async {
    await _db.execute('CREATE TABLE IF NOT EXISTS uni (val TEXT)');
    await _db.execute('INSERT INTO uni (val) VALUES (?)', params: ['Ñame']);

    final results = await _db.query(
      "SELECT * FROM uni WHERE COLLATE(val, 'NOCASE') = COLLATE(?, 'NOCASE')",
      params: ['ñame'],
    );

    if (results.isNotEmpty) {
      final match = results.first.values[0];
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Unicode Match Found: $match'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ));
    }
  }

  // FEATURE: Engine Tuning
  // Use PRAGMA to tune engine behavior.
  Future<void> _runPragmaDemo() async {
    await _db.pragma('cache_size', '10000');
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Cache Size Configured'),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Scaffold(body: Center(child: Text(_status)));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stoolap Feature Showcase'),
        actions: [
          IconButton(icon: const Icon(Icons.table_rows), onPressed: _showTables, tooltip: 'Show Tables'),
          IconButton(icon: const Icon(Icons.bolt), onPressed: _runBatch, tooltip: 'Batch Execute'),
          IconButton(icon: const Icon(Icons.analytics), onPressed: _explainQuery, tooltip: 'Explain Query'),
          IconButton(icon: const Icon(Icons.reply), onPressed: _addAndReturn, tooltip: 'Insert Returning'),
          IconButton(icon: const Icon(Icons.settings), onPressed: _runPragmaDemo, tooltip: 'Pragma Demo'),
          IconButton(icon: const Icon(Icons.language), onPressed: _unicodeDemo, tooltip: 'Unicode Demo'),
          IconButton(icon: const Icon(Icons.code), onPressed: _jsonDemo, tooltip: 'JSON Demo'),
          IconButton(icon: const Icon(Icons.psychology), onPressed: _semanticSearch, tooltip: 'Semantic Search'),
          IconButton(icon: const Icon(Icons.layers), onPressed: _runRecursiveCTE, tooltip: 'Recursive CTE'),
          IconButton(icon: const Icon(Icons.account_balance), onPressed: _runTransaction, tooltip: 'Transaction & Savepoints'),
        ],
      ),
      body: Column(
        children: [
          if (_logs.isNotEmpty)
            Container(
              height: 40,
              width: double.infinity,
              color: Colors.black26,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(_logs.last, style: const TextStyle(fontSize: 10, color: Colors.greenAccent, fontFamily: 'monospace')),
            ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blueGrey.withValues(alpha: 0.2),
            child: const Text(
              "DEMO: Reactive 'Live Queries'. Add a note to see the list below update instantly without manual re-fetch.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<StoolapRow>>(
              // FEATURE: Reactive "Live Queries"
              // The stream re-emits results whenever the 'notes' table is modified.
              stream: _db.watch('SELECT * FROM notes ORDER BY id DESC'),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

                final rows = snapshot.data!;
                return ListView.builder(
                  itemCount: rows.length,
                  itemBuilder: (context, index) {
                    final values = rows[index].values;
                    final content = values.length > 1 ? values[1] : "No content";
                    final id = values.isNotEmpty ? values[0] : "?";
                    return ListTile(
                      leading: CircleAvatar(child: Text(id.toString())),
                      title: Text(content.toString()),
                      subtitle: const Text("Pure Rust Embedded Engine"),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ApiResponseSnackBar extends SnackBar {
  ApiResponseSnackBar({super.key, required String message})
      : super(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        );
}
