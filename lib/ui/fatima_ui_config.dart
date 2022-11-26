import 'package:fatima/fatima.dart';
import 'package:fatima/ui/cards/fatima_card_config.dart';
import 'package:fatima/ui/dialog/dialog_config.dart';
import 'package:flutter/material.dart';

class UIConfig {
  final _box = Storage();
  bool storable = false;
  ThemeData? lightTheme;
  ThemeData? darkTheme;
  ThemeMode? themeMode = ThemeMode.system;
  Style? defaultStyle;

  UIConfig({
    this.lightTheme,
    this.darkTheme,
  }) {
    _initializeThemes();
  }

  Color primaryColor() {
    return themeMode == ThemeMode.dark
        ? defaultStyle!.darkColors!.primaryColor!
        : defaultStyle!.lightColors!.primaryColor!;
  }

  void _initializeThemes() {
    lightTheme = lightTheme ??
        ThemeData(
            fontFamily: 'Vazir',
            colorScheme: ColorScheme.light(
              primary: Color(_box.read<int>("primaryColor")!),
            ),
            appBarTheme: AppBarTheme());

    darkTheme = ThemeData(
        buttonTheme: ButtonThemeData(),
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
          primary: Color(_box.read<int>("primaryColor")!),
        ));
  }

  bool changePrimaryColor() {
    return true;
  }
}
