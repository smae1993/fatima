import 'package:fatima/ui/src/ui_config/style.dart';
import 'package:fatima/ui/src/ui_config/theme_builder_service.dart';
import 'package:flutter/material.dart';

/// 0/5 Complete
class FloatingActionButtonThemeBuilder extends ThemeBuilderService {
  FloatingActionButtonThemeBuilder(List<Style> styles)
      : super(styles
            .where(
                (element) => element.compareTags([StyleTag.all, StyleTag.fab]))
            .toList());

  @override
  generate(dynamic theme) {
    if (theme == null) {
      if (style != null) {
        return FloatingActionButtonThemeData();
      } else {
        return null;
      }
    } else {
      if (style != null) {
        return (theme as FloatingActionButtonThemeData).copyWith();
      } else {
        return theme as FloatingActionButtonThemeData;
      }
    }
  }

  @override
  ThemeData mix(ThemeData data) {
    return data.copyWith(
        floatingActionButtonTheme: generate(data.floatingActionButtonTheme));
  }
}
