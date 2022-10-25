import 'package:fatima/fatima.dart';
import 'package:fatima/fatima_interface.dart';
import 'package:flutter/material.dart';

extension FatimaUiExtension on FatimaInterface {
  FatimaController get _fatimaController => FatimaController.to;

  void changeTheme(ThemeData theme) {
    _fatimaController.setTheme(theme);
  }

  void changeThemeMode(ThemeMode themeMode) {
    _fatimaController.setThemeMode(themeMode);
  }

  void changeUiConfig() {}

  void toggleThemeMode() {
    _fatimaController.toggleThemeMode();
  }

  void setPrimaryColor(Color color) {
    _fatimaController.changePrimaryColor(color);
  }
}
