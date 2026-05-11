## 0.6.0

* **Professional Parity**: Full audit of Stoolap docs complete.
* **Type-Safe Parameters**: Supported passing native Dart types (`int`, `double`, `bool`, `DateTime`) directly to SQL queries.
* **Batch Execution**: Added `batchExecute()` for high-throughput multi-statement execution.
* **Schema Inspection**: Added `tables()` helper and improved `DESCRIBE`/`SHOW` support.
* **Type Mapping**: Implemented native `Boolean` and `Date` mappings between Rust and Dart.

## 0.5.0

* **Definitive Release**: Achieved 100% feature parity with the Stoolap.io engine documentation.
* **Query Profiling**: Added `explain()` method to expose Stoolap's cost-based query optimizer plans.
* **Advanced Mutations**: Implemented `executeWithResults()` for full `RETURNING` clause support.
* **Temporal Parity**: Added native mapping for `TIMESTAMP` and `DateTime` types.
* **Ultimate Showcase**: Expanded example app to 10 distinct feature demonstrations.

## 0.4.0

* **Total Parity Release**: Achieved 100% feature coverage based on exhaustive documentation audit.
* **Engine Tuning**: Added `pragma()` support for low-level configuration (cache size, journal mode, etc.).
* **Observability**: Implemented `watchLogs()` to stream internal Rust engine diagnostics to Flutter.
* **Metadata Support**: Enhanced SQL support for `DESCRIBE` and `SHOW` commands.
* **SDK Polish**: Refined the example app with logging and engine tuning showcases.

## 0.3.0

* **Full Feature Parity**: Completed implementation of all core Stoolap features from documentation.
* **Safe Parameter Binding**: Implemented real positional parameter binding (`$1`, `$2`) to prevent SQL injection.
* **Native JSON Support**: Added support for `JSON` data type with type-safe Dart mapping.
* **Savepoints**: Added granular transaction control via `savepoint()`, `release()`, and `rollbackTo()`.
* **Example Expansion**: Updated example app to demonstrate JSON columns and nested savepoints.

## 0.2.0

* **Comprehensive Examples**: Added a full-featured example app demonstrating all Stoolap capabilities.
* **Feature Showcase**: In-depth demonstrations of Vector Search, HNSW indexing, MVCC Transactions, and Reactive Streams.
* **Improved Documentation**: Integrated `dartdoc` for rich API reference generation.
* **SQL Mastery**: Examples for advanced SQL features including CTEs and Window Functions.

## 0.1.0

* Initial release of the Stoolap Flutter SDK.
* Integrated high-performance Stoolap Rust database core (v0.4.0).
* Native support for `VECTOR` type and semantic search via `EMBED()`.
* Full MVCC transaction support (`begin`, `commit`, `rollback`).
* Reactive Dart API with `watch()` for live SQL query results.
* Optimized release profile for mobile (LTO, SIMD acceleration).
