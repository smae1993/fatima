import 'package:fatima/ui/buttons/fatima_button_config.dart';
import 'package:fatima/ui/cards/fatima_card_config.dart';
import 'package:fatima/ui/dialog/dialog_config.dart';
import 'package:fatima/ui/text_fields/fatima_text_field_config.dart';
import 'package:flutter/material.dart';

import '../fatima.dart';

class UIConfig {
  final _box = Storage();
  ThemeData? theme;
  ThemeData? darkTheme;
  ThemeMode? themeMode;
  Color? primaryColor;
  UIStyle style;
  double radius;
  // Color backgroundColor;
  // Color borderColor;
  // Color foregroundColorl;
  DialogConfig? dialogConfig;
  ButtonConfig? buttonConfig;
  CardConfig? cardConfig;
  TextFieldConfig? textFieldConfig;
  UIConfig({
    this.style = UIStyle.filled,
    this.radius = 10,
    // this.backgroundColor
    this.dialogConfig,
    this.buttonConfig,
    this.cardConfig,
    this.textFieldConfig,
  }) {
    initializeThemes();
  }

  void initializeThemes() {
    theme = theme ??
        ThemeData(
            fontFamily: 'Vazir',
            dialogTheme: DialogTheme(),
            // elevatedButtonTheme: ElevatedButtonThemeData(
            //     style: ElevatedButton.styleFrom(
            //   foregroundColor: Colors.white,
            //   backgroundColor: const Color(0xE8212121),
            //   padding: const EdgeInsets.all(10.0),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            // )),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black54),
            colorScheme: ColorScheme.light(
              primary: _box.read<int>("primaryColor") != null
                  ? Color(_box.read<int>("primaryColor")!)
                  : (primaryColor ?? Colors.blue),
            ));

    darkTheme = ThemeData(
        fontFamily: 'Vazir',
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xE8212121),
          padding: const EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        )),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF282828)),
        colorScheme: ColorScheme.dark(
          primary: _box.read<int>("primaryColor") != null
              ? Color(_box.read<int>("primaryColor")!)
              : (primaryColor ?? Colors.blue),
        ));
  }
}

enum UIStyle {
  filled,
  outlined,
  glassy,
  gradient,
  none,
}
