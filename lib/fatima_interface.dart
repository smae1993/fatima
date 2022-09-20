// import 'log.dart';
// import 'smart_management.dart';

import 'package:fatima/core/log.dart';
import 'package:fatima/core/smart_management.dart';
import 'package:flutter/foundation.dart';

/// GetInterface allows any auxiliary package to be merged into the "Get"
/// class through extensions
abstract class FatimaInterface {
  SmartManagement smartManagement = SmartManagement.full;
  bool isLogEnable = kDebugMode;
  LogWriterCallback log = defaultLogWriterCallback;
}
