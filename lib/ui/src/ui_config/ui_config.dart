import 'package:fatima/fatima.dart';
import 'package:fatima/ui/src/ui_config/theme_builder.dart';
import 'package:flutter/material.dart';

class UIConfig {
  // final _box = Storage();
  bool storable = false;
  late ThemeData lightTheme;
  late ThemeData darkTheme;
  ThemeMode? themeMode = ThemeMode.system;
  List<Style> defaultStyles = [];

  UIConfig({
    ThemeData? light,
    ThemeData? dark,
    List<Style>? styles,
    // Style? appbar,
  }) {
    defaultStyles = styles ?? [];
    _initializeThemes(light, dark);
  }

  void _initializeThemes(ThemeData? light, ThemeData? dark) {
    lightTheme = light ??
        _generateThemeData(
            ThemeMode.light,
            defaultStyles
                .where((element) => element.mode == ThemeMode.light)
                .toList());
    darkTheme = dark ??
        _generateThemeData(
            ThemeMode.dark,
            defaultStyles
                .where((element) => element.mode == ThemeMode.dark)
                .toList());
  }

  ThemeData _generateThemeData(ThemeMode mode, List<Style> styles) {
    Style? mainStyle = styles.firstOrNull;
    for (var element in styles.where(
        (element) => element.compareTags([StyleTag.all, StyleTag.main]))) {
      mainStyle!.merge(element);
    }

    mainStyle ??=
        mode == ThemeMode.light ? defaultLightStyle() : defaultDarkStyle();

    return ThemeData(
      fontFamily: mainStyle.fontFamily ?? 'Vazir',
      backgroundColor: mainStyle.background,
      primaryColor: mainStyle.primary,
      appBarTheme: ThemeBuilder<AppBar>(styles: styles).generate(),
      cardTheme: ThemeBuilder<Card>(styles: styles).generate(),
      iconTheme: ThemeBuilder<Icon>(styles: styles).generate(),
      textTheme: ThemeBuilder<Text>(styles: styles).generate(), // Complex
      radioTheme: ThemeBuilder<Radio>(styles: styles).generate(),
      dialogTheme: ThemeBuilder<Dialog>(styles: styles).generate(),

      colorScheme: mainStyle.colorScheme(),
    );
  }

  Color primaryColor() {
    return getTheme().primaryColor;
  }

  ThemeData getTheme() {
    return themeMode == ThemeMode.light ? lightTheme : darkTheme;
  }

  bool changePrimaryColor() {
    return true;
  }

  Style defaultLightStyle() {
    return Style(
      mode: ThemeMode.light,
      primary: Colors.red,
    );
  }

  Style defaultDarkStyle() {
    return Style(mode: ThemeMode.dark, primary: Colors.blueAccent);
  }
}
