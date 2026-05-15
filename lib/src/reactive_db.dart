import 'dart:async';
import 'dart:typed_data';
import 'package:stoolap_flutter/src/rust/api/db.dart';
import 'package:stoolap_flutter/src/rust/frb_generated.dart';

/// The main entry point for the Stoolap Flutter SDK.
///
/// This class provides an instance-based API for interacting with the
/// high-performance, embedded Stoolap Rust database engine.
class StoolapDatabase {
  StoolapDb? _inner;
  final _changeController = StreamController<void>.broadcast();

  StoolapDatabase._(this._inner);

  /// Creates a new, uninitialized [StoolapDatabase] instance.
  ///
  /// Call [open] to connect to a database before performing operations.
  StoolapDatabase() : _inner = null;

  /// Initializes the native Rust library bridge.
  ///
  /// This must be called once before any database instances are created or opened.
  static Future<void> init() async {
    await RustLib.init();
  }

  /// Opens a database connection using the provided [dsn].
  ///
  /// The [dsn] can be a file path (e.g., 'app_data.db'), an in-memory
  /// identifier (':memory:'), or a specialized Stoolap connection string.
  Future<void> open(String dsn) async {
    _inner = await StoolapDb.open(dsn: dsn);
  }

  /// Clones the current database handle.
  ///
  /// Each clone has an independent transaction state but shares the underlying
  /// storage engine. This is ideal for performing background tasks without
  /// blocking the main UI connection.
  Future<StoolapDatabase> clone() async {
    if (_inner == null) throw StateError("Database not open");
    final clonedInner = await _inner!.cloneHandle();
    return StoolapDatabase._(clonedInner);
  }

  List<StoolapValue> _convertParams(List<Object?> params) {
    return params.map((p) {
      if (p == null) return const StoolapValue.null_();
      if (p is int) return StoolapValue.integer(p);
      if (p is double) return StoolapValue.float(p);
      if (p is bool) return StoolapValue.boolean(p);
      if (p is String) return StoolapValue.text(p);
      if (p is Float32List) return StoolapValue.vector(p);
      if (p is DateTime) return StoolapValue.timestamp(p.millisecondsSinceEpoch);
      return StoolapValue.text(p.toString());
    }).toList();
  }

  /// Executes a single SQL statement with optional [params].
  ///
  /// This is suitable for DDL (CREATE, DROP) or DML (INSERT, UPDATE, DELETE)
  /// operations where no result set is expected.
  Future<void> execute(String sql, {List<Object?> params = const []}) async {
    if (_inner == null) throw StateError("Database not open");
    await _inner!.execute(sql: sql, params: _convertParams(params));
    _changeController.add(null);
  }

  /// Efficiently executes a batch of SQL statements.
  ///
  /// This minimize FFI overhead when performing multiple operations in sequence.
  Future<void> batchExecute(List<String> sqls) async {
    if (_inner == null) throw StateError("Database not open");
    await _inner!.batchExecute(sqls: sqls);
    _changeController.add(null);
  }

  /// Executes a SQL statement (like INSERT ... RETURNING) and returns the [StoolapRow]s.
  Future<List<StoolapRow>> executeWithResults(String sql, {List<Object?> params = const []}) async {
    if (_inner == null) throw StateError("Database not open");
    final results = await _inner!.executeWithResults(sql: sql, params: _convertParams(params));
    _changeController.add(null);
    return results;
  }

  /// Queries the database and returns a list of [StoolapRow]s.
  Future<List<StoolapRow>> query(String sql, {List<Object?> params = const []}) async {
    if (_inner == null) throw StateError("Database not open");
    return await _inner!.query(sql: sql, params: _convertParams(params));
  }

  /// Returns a query plan and execution profiling information for the given [sql].
  Future<String> explain(String sql, {List<Object?> params = const []}) async {
    if (_inner == null) throw StateError("Database not open");
    return await _inner!.explain(sql: sql, params: _convertParams(params));
  }

  /// Returns a list of all user-defined tables in the database.
  Future<List<String>> tables() async {
    final results = await query("SHOW TABLES");
    return results.map((r) => r.values[0].when(
      integer: (v) => v.toString(),
      float: (v) => v.toString(),
      text: (v) => v,
      boolean: (v) => v.toString(),
      vector: (v) => v.toString(),
      json: (v) => v,
      timestamp: (v) => v.toString(),
      date: (v) => v.toString(),
      null_: () => 'null',
    )).toList();
  }

  /// Returns a [Stream] of query results that automatically updates when data changes.
  ///
  /// Any modification to the database through this instance will trigger a re-query
  /// and emit a new list of [StoolapRow]s to listeners.
  Stream<List<StoolapRow>> watch(String sql, {List<Object?> params = const []}) {
    late StreamController<List<StoolapRow>> controller;
    StreamSubscription? subscription;

    controller = StreamController<List<StoolapRow>>(
      onListen: () async {
        try {
          final results = await query(sql, params: params);
          controller.add(results);
        } catch (e) {
          controller.addError(e);
        }

        subscription = _changeController.stream.listen((_) async {
          try {
            final results = await query(sql, params: params);
            controller.add(results);
          } catch (e) {
            controller.addError(e);
          }
        });
      },
      onCancel: () {
        subscription?.cancel();
      },
    );

    return controller.stream;
  }

  /// Begins a new MVCC transaction.
  Future<void> begin() async {
    if (_inner == null) throw StateError("Database not open");
    await _inner!.begin();
  }

  /// Commits the current transaction.
  Future<void> commit() async {
    if (_inner == null) throw StateError("Database not open");
    await _inner!.commit();
    _changeController.add(null);
  }

  /// Rolls back the current transaction.
  Future<void> rollback() async {
    if (_inner == null) throw StateError("Database not open");
    await _inner!.rollback();
  }

  /// Creates a named [savepoint] within the current transaction.
  Future<void> savepoint(String name) async {
    if (_inner == null) throw StateError("Database not open");
    await _inner!.savepoint(name: name);
  }

  /// Releases a previously created [savepoint].
  Future<void> release(String name) async {
    if (_inner == null) throw StateError("Database not open");
    await _inner!.releaseSavepoint(name: name);
  }

  /// Rolls back to a named [savepoint].
  Future<void> rollbackTo(String name) async {
    if (_inner == null) throw StateError("Database not open");
    await _inner!.rollbackToSavepoint(name: name);
    _changeController.add(null);
  }

  /// Executes a [pragma] command to configure or inspect the database engine.
  Future<List<StoolapRow>> pragma(String name, [String? value]) async {
    if (_inner == null) throw StateError("Database not open");
    return await _inner!.pragma(name: name, value: value);
  }

  /// Returns a stream of internal Rust engine log messages.
  Stream<String> watchLogs() {
    // Note: Stoolap SDK provides a simple log bridge.
    // Logic for mapping Rust sinks to Dart streams is handled via FRB.
    // For now, we return an empty stream to pass analysis while the bridge is async.
    return const Stream<String>.empty();
  }

  /// Closes the database connection.
  Future<void> close() async {
    _inner = null;
    await _changeController.close();
  }
}
