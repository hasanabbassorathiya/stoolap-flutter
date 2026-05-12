# Stoolap Flutter SDK
> The high-performance SQL database that ships with your app.

[![pub package](https://img.shields.io/pub/v/stoolap_flutter.svg)](https://pub.dev/packages/stoolap_flutter)
[![license](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/hasanabbassorathiya/stoolap-flutter/blob/main/LICENSE)

Stoolap is a high-performance, embedded SQL database written entirely in Rust. It brings enterprise-grade features like MVCC transactions, parallel execution, and native vector search directly to your Flutter applications.

**Official Reference:** [https://stoolap.io/](https://stoolap.io/)
**Pub.dev:** [https://pub.dev/packages/stoolap_flutter](https://pub.dev/packages/stoolap_flutter)

---

## What is Stoolap?

Stoolap is a modern embedded SQL database that provides full ACID transactions with MVCC, a sophisticated cost-based query optimizer, and features that rival established databases like PostgreSQL and DuckDB. Built entirely in Rust with minimal unsafe code (only for FFI and performance-critical hot paths), Stoolap features multiple index types (B-tree, Hash, Bitmap, HNSW), native vector search with semantic search support, parallel query execution, and comprehensive SQL support including window functions, CTEs, and temporal queries.

---

## Features 📦

*   🦀 **Pure Rust Core:** Memory-safe and lightning-fast database engine.
*   🔍 **Native Vector Search:** `VECTOR` type and HNSW indexes for sub-linear semantic search.
*   ⚡ **Parallel Execution:** Automatically parallelizes joins, sorts, and aggregations across all CPU cores.
*   🛡️ **MVCC Transactions:** Full ACID compliance with snapshot isolation. Readers never block writers.
*   🕰️ **Time-Travel Queries:** Query your data exactly as it existed in the past using the `AS OF` syntax.
*   🔄 **Reactive API:** Built-in support for "Live Queries" using Dart Streams.
*   🏗️ **Advanced SQL:** Supports CTEs (including Recursive), Window Functions, and standard SQL joins.
*   📱 **Mobile Optimized:** Optimized with SIMD for ARM64 (M1/M2 and modern Android chips).

---

## Quick Start 🚀

It's super easy to get started. You just need to initialize Stoolap and open your database.

### 1. Installation

Add `stoolap_flutter` to your `pubspec.yaml`:

```yaml
dependencies:
  stoolap_flutter: ^1.1.0
```

### 2. Initialization

Initialize the native Rust bridge in your `main()` function:

```dart
import 'package:stoolap_flutter/stoolap_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize the native Rust library
  await StoolapDatabase.init();
  
  runApp(const MyApp());
}
```

### 3. Basic Usage

```dart
final db = StoolapDatabase();
await db.open('my_app_data.db');

// Execute a command
await db.execute('CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT)');

// Insert with parameters
await db.execute('INSERT INTO users (name) VALUES (?)', params: ['Alice']);

// Query results
final rows = await db.query('SELECT * FROM users');
for (var row in rows) {
  print('User: ${row.values[1]}'); // Access by index
}
```

---

## Documentation 📚

*   🦀 **[Rust Engine Docs](https://stoolap.io/docs/)** – Full SQL reference and architecture details.
*   🎯 **[Vector Search Guide](https://stoolap.io/docs/data-types/vector-search/)** – Learn how to build semantic search.
*   🤝 **[Contributing](CONTRIBUTING.md)** – Help us build the future of mobile databases.

---

## Advanced Features 🛠️

### Semantic Vector Search

Stoolap handles embeddings natively. No need for external Python scripts or API calls for distance calculations.

```dart
// Create table with vector support (384-dimensional)
await db.execute('''
  CREATE TABLE items (
    id INTEGER PRIMARY KEY,
    description TEXT,
    embedding VECTOR(384)
  )
''');

// Perform semantic search using Cosine distance
final results = await db.query('''
  SELECT description FROM items 
  ORDER BY VEC_DISTANCE_COSINE(embedding, EMBED(?)) 
  LIMIT 5
''', params: ['high-performance database']);
```

### Reactive Live Queries

Use `watch()` to create a stream that automatically re-emits whenever the underlying tables change.

```dart
StreamBuilder<List<StoolapRow>>(
  stream: db.watch('SELECT * FROM users ORDER BY id DESC'),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return const CircularProgressIndicator();
    final users = snapshot.data!;
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => ListTile(title: Text(users[index].values[1].toString())),
    );
  },
);
```

## Performance & Benchmarks ⚡

Stoolap is engineered for high-performance mobile and edge workloads. Unlike single-threaded databases, it leverages **Rayon** for automatic query parallelization and **SIMD** (NEON/AVX) for lightning-fast vector math.

### Real-World Performance (vs SQLite & DuckDB)

*Official benchmarks performed on Apple Silicon using identical 10k row workloads. Source: [Stoolap Official Benchmarks](https://github.com/stoolap/stoolap/blob/main/BENCHMARKS.md).*

| Operation | **Stoolap** | SQLite | DuckDB | Speedup (vs SQLite) |
| :--- | :---: | :---: | :---: | :---: |
| **COUNT DISTINCT** | **0.37 µs** | 105.98 µs | 219.91 µs | **286x** |
| **Subquery Compare** | **5.52 µs** | 1424.07 µs | 293.51 µs | **258x** |
| **Aggregation (GROUP BY)** | **48.81 µs** | 1403.39 µs | 104.32 µs | **29x** |
| **SELECT by ID** | **0.12 µs** | 0.21 µs | 145.55 µs | **1.7x** |
| **Vector Search (k-NN)** | **4ms** | N/A | N/A | **Native** |

### Mobile Performance Breakdown

| Feature | **Stoolap (Rust)** | SQLite (C) | Hive (Dart) |
| :--- | :--- | :--- | :--- |
| **Parallelism** | **Automatic (Multi-core)** | Single-threaded | Single-threaded |
| **Concurrency** | **MVCC (Readers don't block)** | Lock-based | Lock-based |
| **Vector Index** | **Native HNSW** | ✗ | ✗ |
| **Optimizer** | **Cost-Based (PostgreSQL-style)** | Rule-Based | ✗ |

### Why is Stoolap faster?

1.  **Pure Rust Performance:** Compiled with LTO and `opt-level = 3` for mobile ARM64.
2.  **Snapshot Isolation (MVCC):** High-throughput concurrent reads and writes without contention.
3.  **Adaptive Query Execution:** The optimizer learns from actual data distributions to choose the fastest plan.
4.  **Hardware Acceleration:** Direct use of ARM NEON instructions for vector distance metrics.

---

## Join our community 🤝

We're building the most powerful embedded database for Flutter. Join us on [GitHub](https://github.com/hasanabbassorathiya/stoolap-flutter) to report issues, suggest features, or contribute code.

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
