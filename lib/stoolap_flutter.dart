/// High-performance, pure Rust embedded SQL database for Flutter.
///
/// This library provides a reactive Dart SDK for Stoolap, supporting
/// native Vector Search, MVCC transactions, and automatic UI updates
/// via live query Streams.
library;

export 'src/reactive_db.dart';
export 'src/rust/api/db.dart' show StoolapRow, StoolapValue;
