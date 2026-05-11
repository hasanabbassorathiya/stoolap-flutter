import 'package:flutter/material.dart';
import 'package:stoolap_flutter/stoolap_flutter.dart';

/// Stoolap Flutter SDK Example
///
/// This example demonstrates every major feature of the Stoolap SDK:
/// 1. Initialization
/// 2. Basic CRUD Operations
/// 3. MVCC Transactions
/// 4. Native Vector Search & HNSW Indexing
/// 5. Reactive "Live" Queries with Streams
/// 6. Advanced SQL (CTEs and Window Functions)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FEATURE: Initialization
  // The native Rust bridge must be initialized once before any DB operations.
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

  @override
  void initState() {
    super.initState();
    _setupDatabase();
  }

  Future<void> _setupDatabase() async {
    try {
      // FEATURE: Opening a Database
      // Provide a local path. Stoolap creates the file if it doesn't exist.
      await _db.open('showcase.db');

      // FEATURE: Basic SQL Execution
      // Create tables for our different features
      await _db.execute('CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY, content TEXT, category TEXT)');

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

  // FEATURE: CRUD Operations
  Future<void> _addNote() async {
    final timestamp = DateTime.now().toIso8601String();
    await _db.execute(
      'INSERT INTO notes (content, category) VALUES (?, ?)',
      params: ['New note at $timestamp', 'General'],
    );
    // Note: No need to call setState() if using .watch()! The UI updates automatically.
  }

  // FEATURE: MVCC Transactions
  // Atomic multi-step operations. If any fail, none are applied.
  Future<void> _runTransaction() async {
    await _db.begin();
    try {
      await _db.execute('INSERT INTO notes (content) VALUES (?)', params: ['Tx Step 1']);
      await _db.execute('INSERT INTO notes (content) VALUES (?)', params: ['Tx Step 2']);
      await _db.commit(); // Only now are the notes visible to others
      ScaffoldMessenger.of(context).showSnackBar(ApiResponseSnackBar(message: 'Transaction Committed'));
    } catch (e) {
      await _db.rollback();
      ScaffoldMessenger.of(context).showSnackBar(ApiResponseSnackBar(message: 'Transaction Failed & Rolled Back: $e'));
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
      ScaffoldMessenger.of(context).showSnackBar(ApiResponseSnackBar(message: 'Top Semantic Match: $topMatch'));
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
    ScaffoldMessenger.of(context).showSnackBar(ApiResponseSnackBar(message: 'Recursive CTE output: $output'));
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
          IconButton(icon: const Icon(Icons.psychology), onPressed: _semanticSearch, tooltip: 'Semantic Search'),
          IconButton(icon: const Icon(Icons.layers), onPressed: _runRecursiveCTE, tooltip: 'Recursive CTE'),
          IconButton(icon: const Icon(Icons.account_balance), onPressed: _runTransaction, tooltip: 'Transaction'),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blueGrey.withOpacity(0.2),
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
