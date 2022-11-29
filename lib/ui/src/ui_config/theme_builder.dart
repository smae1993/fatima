import 'package:fatima/fatima.dart';
import 'package:fatima/ui/src/ui_config/theme_builder_service.dart';
import 'package:fatima/ui/src/ui_config/theme_builders/appbar_builder.dart';
import 'package:fatima/ui/src/ui_config/theme_builders/card_builder.dart';
import 'package:fatima/ui/src/ui_config/theme_builders/icon_builder.dart';
import 'package:fatima/ui/src/ui_config/theme_builders/radio_builder.dart';
import 'package:fatima/ui/src/ui_config/theme_builders/text_builder.dart';
import 'package:fatima/ui/src/ui_config/theme_builders/unknown_builder.dart';
import 'package:flutter/material.dart';

part 'builders.dart';

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
    if (T == AppBar) return AppbarThemeBuilder(styles);
    if (T == Card) return CardThemeBuilder(styles);
    if (T == Icon) return IconThemeBuilder(styles);
    if (T == Text) return TextThemeBuilder(styles);
    if (T == Radio) return RadioThemeBuilder(styles);
    if (T == Dialog) return UnknownBuilder(styles);
    // if (type is Card) return AppbarThemeBuilderService();

    return UnknownBuilder(styles);
  }
}
