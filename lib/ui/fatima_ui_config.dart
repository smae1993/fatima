import 'package:fatima/fatima.dart';
import 'package:fatima/ui/cards/fatima_card_config.dart';
import 'package:fatima/ui/dialog/dialog_config.dart';
import 'package:flutter/material.dart';

class UIConfig {
  FatimaController get _fatimaController => FatimaController.to;
  final _box = Storage();
  bool storable = false;
  ThemeData? theme;
  ThemeData? darkTheme;
  ThemeMode? themeMode = ThemeMode.system;
  Color color;
  UIStyle style;
  double radius;
  // Color backgroundColor;
  // Color borderColor;
  // Color foregroundColorl;
  DialogConfig? dialogConfig;
  CardConfig? cardConfig;
  UIConfig({
    this.style = UIStyle.filled,
    this.radius = 10,
    this.color = Colors.red,
    // this.backgroundColor
    this.dialogConfig,
    this.cardConfig,
  }) {
    initializeThemes();
  }

  void initializeThemes() {
    theme = theme ??
        ThemeData(
            fontFamily: 'Vazir',
            colorScheme: ColorScheme.light(
              primary: _box.read<int>("primaryColor") != null
                  ? Color(_box.read<int>("primaryColor")!)
                  : (color),
            ));

    darkTheme = ThemeData(
        fontFamily: 'Vazir',
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //   foregroundColor: Colors.white,
        //   backgroundColor: Color.fromARGB(232, 113, 31, 31),
        //   padding: const EdgeInsets.all(10.0),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //   ),
        // )),
        // appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF282828)),
        dialogTheme: DialogTheme(),
        colorScheme: ColorScheme.dark(
          primary: _box.read<int>("primaryColor") != null
              ? Color(_box.read<int>("primaryColor")!)
              : color,
        ));
  }

  bool changePrimaryColor() {
    return true;
  }
}

enum UIStyle {
  filled,
  outlined,
  glassy,
  gradient,
  none,
}
