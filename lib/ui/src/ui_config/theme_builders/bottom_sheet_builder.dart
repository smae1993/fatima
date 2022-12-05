import 'package:fatima/ui/src/ui_config/style.dart';
import 'package:fatima/ui/src/ui_config/theme_builder_service.dart';
import 'package:flutter/material.dart';

/// 0/5 Complete
class BottomSheetThemeBuilder extends ThemeBuilderService {
  BottomSheetThemeBuilder(List<Style> styles)
      : super(styles
            .where((element) =>
                element.compareTags([StyleTag.all, StyleTag.bottomSheet]))
            .toList());

  @override
  generate(dynamic theme) {
    if (theme == null) {
      if (style != null) {
        return BottomSheetThemeData();
      } else {
        return null;
      }
    } else {
      if (style != null) {
        return (theme as BottomSheetThemeData).copyWith();
      } else {
        return theme as BottomSheetThemeData;
      }
    }
  }

  @override
  ThemeData mix(ThemeData data) {
    return data.copyWith(bottomSheetTheme: generate(data.bottomSheetTheme));
  }
}
