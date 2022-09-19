import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FatimaController extends GetxController {
  final _box = GetStorage();

  bool isDark() => _box.read("isDark") ?? false;
  Color textColor() => Color(_box.read("textColor") ?? 0xFF292929);
  Color primaryColor() => Color(_box.read("primaryColor") ?? 0xFF1976D2);
}
