import 'package:flutter/material.dart';

class Style {
  ThemeMode mode;
  StyleTag tag = StyleTag.all;
  // late LightPallet lightPallet;
  // late DarkPallet darkPallet;
  /// ----------------------- Colors
  Color? background;
  Color? primary;
  Color? foreground;
  Color? border;
  Color? secondary;
  Color? shadow;

  ///
  double? borderRadius;
  double? borderWidth;
  EdgeInsets? padding;
  EdgeInsets? margin;

  /// ---------------------- Text Style
  String? fontFamily;
  double? fontSize;
  double? fontWeight;
  TextAlign? textAlign;

  /// ---------------------- Sizing
  Size? size;

  double? maxWidth;
  double? maxHeight;

  ///
  double? blur;

  Style({
    required this.mode,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.padding,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
  }) {}

  ColorScheme colorScheme() {
    ColorScheme scheme = mode == ThemeMode.light
        ? const ColorScheme.light()
        : const ColorScheme.dark();

    return scheme.copyWith(
      background: background,
      primary: primary,
      onBackground: foreground,
      outline: border,
      secondary: secondary,
      shadow: shadow,
    );
  }

  void merge(Style newStyle) {
    background = newStyle.background ?? background;
    primary = newStyle.primary ?? primary;
    foreground = newStyle.foreground ?? foreground;
    border = newStyle.border ?? border;
    secondary = newStyle.secondary ?? secondary;
    shadow = newStyle.shadow ?? shadow;
    borderRadius = newStyle.borderRadius ?? borderRadius;
    borderWidth = newStyle.borderWidth ?? borderWidth;
    padding = newStyle.padding ?? padding;
    margin = newStyle.margin ?? margin;
    fontFamily = newStyle.fontFamily ?? fontFamily;
    fontSize = newStyle.fontSize ?? fontSize;
    fontWeight = newStyle.fontWeight ?? fontWeight;
    textAlign = newStyle.textAlign ?? textAlign;
    size = newStyle.size ?? size;
    maxWidth = newStyle.maxWidth ?? maxWidth;
    maxHeight = newStyle.maxHeight ?? maxHeight;
    blur = newStyle.blur ?? blur;
  }
}

// abstract class StylePallet {
//   StylePallet(
//       {this.background,
//       this.primary,
//       this.foreground,
//       this.border,
//       this.secondary,
//       this.shadow});

//   ThemeMode mode();
// }

// class DarkPallet extends StylePallet {
//   DarkPallet(
//       {super.background,
//       super.primary,
//       super.foreground,
//       super.border,
//       super.secondary,
//       super.shadow}) {
//     background = background ?? const Color(0xFF464748);
//     primary = primary ?? const Color(0xFF99A799);
//     foreground = foreground ?? const Color(0xFFEEEEEE);
//     border = border ?? const Color(0xFF323333);
//   }
//   @override
//   ThemeMode mode() => ThemeMode.dark;
// }

// class LightPallet extends StylePallet {
//   LightPallet() {
//     background = const Color(0xFFFEF5ED);
//     primary = const Color(0xFF99A799);
//     foreground = const Color(0xFF373737);
//     border = const Color(0xFFB1AAA4);
//   }
//   @override
//   ThemeMode mode() => ThemeMode.light;
// }

enum StyleTag {
  main,
  all,
  appBar,
  button,
  card,
  textField,
}
