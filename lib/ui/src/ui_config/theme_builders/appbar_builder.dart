import 'package:fatima/ui/src/ui_config/style.dart';
import 'package:fatima/ui/src/ui_config/theme_builder_service.dart';
import 'package:flutter/material.dart';

class AppbarThemeBuilder extends ThemeBuilderService {
  AppbarThemeBuilder(List<Style> styles)
      : super(styles
            .where((element) =>
                element.compareTags([StyleTag.all, StyleTag.appBar]))
            .toList());

  @override
  generate(dynamic theme) {
    if (theme == null) {
      if (style != null) {
        bool hasBorder = (style!.border != null || style!.borderWidth != null);
        var hasShape = hasBorder || style!.borderRadius != null;
        return AppBarTheme(
          backgroundColor: style!.background,
          shape: hasShape
              ? RoundedRectangleBorder(
                  side: (style!.border != null || style!.borderWidth != null)
                      ? BorderSide(
                          color:
                              style!.border ?? style!.colorScheme().background,
                          width: style!.borderWidth!,
                        )
                      : BorderSide.none,
                  borderRadius: BorderRadius.circular(
                      style!.borderRadius ?? 8), // <-- Radius
                )
              : null,
        );
      } else {
        return null;
      }
    } else {
      if (style != null) {
        return (theme as AppBarTheme).copyWith(
          backgroundColor: style!.background ?? theme.backgroundColor,
        );
      } else {
        return theme as AppBarTheme;
      }
    }
  }

  @override
  ThemeData mix(ThemeData data) {
    return data.copyWith(appBarTheme: generate(data.appBarTheme));
  }
}

// AppBarTheme _appBarTheme(ThemeMode mode, Style style) {}
