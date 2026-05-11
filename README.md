# Stoolap Flutter SDK

High-performance, pure Rust embedded SQL database for Flutter with native Vector Search and MVCC transactions.

## Features

*   **Embedded & Pure Rust**: Runs entirely on device with zero external dependencies.
*   **Vector Search**: Native `VECTOR` type with HNSW indexes for sub-linear semantic search.
*   **MVCC Transactions**: Full ACID support with snapshot isolation.
*   **Reactive API**: Watch SQL queries with Dart Streams for auto-updating UIs.
*   **Time-Travel**: Query data as it existed at any point in time via `AS OF`.
*   **Parallel Execution**: Leverages multi-core mobile processors for heavy queries.

## Getting Started

### 1. Initialize
```dart
import 'package:stoolap_flutter/stoolap_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StoolapDatabase.init(); // Initialize Rust bridge
  runApp(MyApp());
}
```

### 2. Basic SQL
```dart
final db = StoolapDatabase();
await db.open('app_data.db');

await db.execute('CREATE TABLE items (id INTEGER PRIMARY KEY, content TEXT)');
await db.execute('INSERT INTO items (content) VALUES (?)', params: ['Hello Stoolap']);

final rows = await db.query('SELECT * FROM items');
```

### 3. Vector & Semantic Search
```dart
// Create table with vector support
await db.execute('''
  CREATE TABLE docs (
    id INTEGER PRIMARY KEY,
    content TEXT,
    embedding VECTOR(384)
  )
''');

// Perform semantic search
final results = await db.query('''
  SELECT content FROM docs 
  ORDER BY VEC_DISTANCE_COSINE(embedding, EMBED(?)) 
  LIMIT 5
''', params: ['find similar documents']);
```

### 4. Reactive "Live" Queries
```dart
// The stream automatically re-emits when data in the DB changes
Stream<List<StoolapRow>> itemStream = db.watch('SELECT * FROM items');

StreamBuilder<List<StoolapRow>>(
  stream: itemStream,
  builder: (context, snapshot) {
    // Build your UI here
  },
);
```

## Performance Optimization

Stoolap automatically uses a Rayon work-stealing scheduler to parallelize large queries. For mobile, it is optimized to use SIMD instructions on ARM64 (M1/M2 and modern Android chips) for lightning-fast vector distance calculations.

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to get started with both Rust and Dart changes.

Anyone can use, modify, and distribute their own version of this SDK.

## License

Apache 2.0
