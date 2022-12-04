import 'package:fatima/ui/src/ui_config/style.dart';
import 'package:fatima/ui/src/ui_config/theme_builder_service.dart';
import 'package:flutter/material.dart';

/// 0/5 Complete
class SwitchThemeBuilder extends ThemeBuilderService {
  SwitchThemeBuilder(List<Style> styles)
      : super(styles
            .where((element) =>
                element.compareTags([StyleTag.all, StyleTag.drawer]))
            .toList());

  @override
  generate(dynamic theme) {
    if (theme == null) {
      if (style != null) {
        return SwitchThemeData();
      } else {
        return null;
      }
    } else {
      if (style != null) {
        return (theme as SwitchThemeData).copyWith();
      } else {
        return theme as SwitchThemeData;
      }
    }
  }

  @override
  ThemeData mix(ThemeData data) {
    return data.copyWith(switchTheme: generate(data.switchTheme));
  }
}
