import 'package:fatima/sotrage/storage.dart';
import 'package:fatima/state_manager/controller/controller.dart';
import 'package:flutter/material.dart';

class FatimaController extends Controller {
  final _box = Storage();

  bool isDark() => _box.read("isDark") ?? false;
  Color textColor() => Color(_box.read("textColor") ?? 0xFF292929);
  Color primaryColor() => Color(_box.read("primaryColor") ?? 0xFF1976D2);
}
