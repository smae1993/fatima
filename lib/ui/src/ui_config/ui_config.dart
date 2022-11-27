import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

part 'button_theme.dart';
part 'appbar_theme.dart';

class UIConfig {
  // final _box = Storage();
  bool storable = false;
  late ThemeData lightTheme;
  late ThemeData darkTheme;
  ThemeMode? themeMode = ThemeMode.system;
  List<Style> defaultStyle = [];

  UIConfig({
    ThemeData? light,
    ThemeData? dark,
    List<Style>? defStyle,
    // Style? appbar,
  }) {
    defaultStyle = defStyle ?? [];
    // appbarStyle = appbar ??
    //     Style(
    //         darkPallet: DarkPallet(
    //             background: const Color(0xFF3A3A3B), border: Colors.red),
    //         lightPallet: LightPallet());

    _initializeThemes(light, dark);
  }

  void _initializeThemes(ThemeData? light, ThemeData? dark) {
    // lightTheme = light ?? _generateThemeData(defaultStyle.lightPallet);
    // darkTheme = dark ?? _generateThemeData(defaultStyle.darkPallet);
    // darkTheme = ThemeData(
    //   typography: Typography.material2021(),
    //     buttonTheme: ButtonThemeData(),
    //     fontFamily: 'Vazir',

    //     // elevatedButtonTheme: ElevatedButtonThemeData(
    //     //     style: ElevatedButton.styleFrom(
    //     //   foregroundColor: Colors.white,
    //     //   backgroundColor: Color.fromARGB(232, 113, 31, 31),
    //     //   padding: const EdgeInsets.all(10.0),
    //     //   shape: RoundedRectangleBorder(
    //     //     borderRadius: BorderRadius.circular(10.0),
    //     //   ),
    //     // )),
    //     // appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF282828)),
    //     dialogTheme: DialogTheme(),
    //     colorScheme: ColorScheme.dark(
    //       primary: Color(_box.read<int>("primaryColor")!),
    //     ));
  }

  // ThemeData _generateThemeData(StylePallet pallet) {
  //   return ThemeData(
  //     fontFamily: defaultStyle.fontFamily ?? 'Vazir',
  //     backgroundColor: pallet.background,
  //     primaryColor: pallet.primary,
  //     appBarTheme: _appBarTheme(themeMode!, appbarStyle),
  //     // appBarTheme: AppBarTheme(color: ),
  //     // elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()),
  //     // buttonTheme: ButtonThemeData(alignedDropdown: ),
  //     colorScheme: pallet.colorScheme(),
  //   );
  // }

  Color primaryColor() {
    return getTheme().primaryColor;
  }

  ThemeData getTheme() {
    return themeMode == ThemeMode.light ? lightTheme : darkTheme;
  }

  bool changePrimaryColor() {
    return true;
  }
}
