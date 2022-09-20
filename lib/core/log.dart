import 'dart:developer' as developer;

import 'package:fatima/fatima.dart';

///VoidCallback from logs
typedef LogWriterCallback = void Function(String text, {bool isError});

/// default logger from Fatima
void defaultLogWriterCallback(String value, {bool isError = false}) {
  if (isError || Fatima.isLogEnable) developer.log(value, name: 'Fatima :');
}
