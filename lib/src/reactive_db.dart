import 'dart:async';
import 'package:stoolap_flutter/src/rust/api/db.dart';
import 'package:stoolap_flutter/src/rust/frb_generated.dart';

class StoolapDatabase {
  final _changeController = StreamController<void>.broadcast();

  static Future<void> init() async {
    await RustLib.init();
  }

  Future<void> open(String path) async {
    await StoolapDb.open(path: path);
  }

  Future<void> execute(String sql, {List<String> params = const []}) async {
    await StoolapDb.execute(sql: sql, params: params);
    _changeController.add(null);
  }

  Future<List<StoolapRow>> query(String sql, {List<String> params = const []}) async {
    return await StoolapDb.query(sql: sql, params: params);
  }

  Stream<List<StoolapRow>> watch(String sql, {List<String> params = const []}) {
    late StreamController<List<StoolapRow>> controller;
    StreamSubscription? subscription;

    controller = StreamController<List<StoolapRow>>(
      onListen: () async {
        // Initial fetch
        try {
          final results = await query(sql, params: params);
          controller.add(results);
        } catch (e) {
          controller.addError(e);
        }

        // Listen for changes
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

  Future<void> begin() async => await StoolapDb.begin();
  Future<void> commit() async {
    await StoolapDb.commit();
    _changeController.add(null);
  }
  Future<void> rollback() async => await StoolapDb.rollback();

  Future<void> close() async {
    await StoolapDb.close();
    await _changeController.close();
  }
}
