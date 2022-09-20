// import 'package:fatima/state_manager/controller/rx_notifier.dart';
// import 'package:get/state_manager.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class ValueStorage<T> extends Value<T> {
  ValueStorage(T value) : super(value);

  Map<String, dynamic> changes = <String, dynamic>{};

  void changeValue(String key, dynamic value) {
    changes = {key: value};
    refresh();
  }
}
