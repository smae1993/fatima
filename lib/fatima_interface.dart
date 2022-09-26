// import 'log.dart';
// import 'smart_management.dart';

// import 'package:fatima/core/log.dart';
// import 'package:fatima/core/smart_management.dart';
import 'package:flutter/foundation.dart';

import 'fatima.dart';

/// GetInterface allows any auxiliary package to be merged into the "Get"
/// class through extensions
abstract class FatimaInterface {
  SmartManagement smartManagement = SmartManagement.full;
  bool isLogEnable = kDebugMode;
  LogWriterCallback log = defaultLogWriterCallback;

  String version = "1.0.0";
}
