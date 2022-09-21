import 'dart:async';

import 'package:fatima/fatima_interface.dart';

// import '../../../get_core/src/get_interface.dart';

extension LoopEventsExt on FatimaInterface {
  Future<T> toEnd<T>(FutureOr<T> Function() computation) async {
    await Future.delayed(Duration.zero);
    final val = computation();
    return val;
  }

  FutureOr<T> asap<T>(T Function() computation,
      {bool Function()? condition}) async {
    T val;
    if (condition == null || !condition()) {
      await Future.delayed(Duration.zero);
      val = computation();
    } else {
      val = computation();
    }
    return val;
  }
}
