import 'package:fatima/fatima.dart';
import 'package:fatima/ui/src/ui_config/theme_builder_service.dart';
import 'package:fatima/ui/src/ui_config/theme_builders/switch_builder.dart';
import 'package:flutter/material.dart';

import 'builders.dart';

class ThemeBuilder<T extends Widget> {
  late ThemeBuilderService _service;

  ThemeBuilder({required List<Style> styles}) {
    _service = _identify(styles);
  }

  dynamic generate() {
    return _service.generate(null);
  }

  ThemeData mix(ThemeData themeData) {
    return _service.mix(themeData);
  }

  ThemeBuilderService _identify(List<Style> styles) {
    switch (T) {
      case AppBar:
        return AppbarThemeBuilder(styles);
      case Card:
        return CardThemeBuilder(styles);
      case Icon:
        return IconThemeBuilder(styles);
      case Text:
        return TextThemeBuilder(styles);
      case Radio:
        return RadioThemeBuilder(styles);
      case Dialog:
        return DialogThemeBuilder(styles);
      case Drawer:
        return DrawerThemeBuilder(styles);
      case Slider:
        return DialogThemeBuilder(styles);
      case Switch:
        return SwitchThemeBuilder(styles);
      case TabBar:
        return SwitchThemeBuilder(styles);
      default:
        return UnknownBuilder(styles);
    }
  }
}
