import 'package:fatima/ui/src/ui_config/style.dart';
import 'package:fatima/ui/src/ui_config/theme_builder_service.dart';
import 'package:flutter/material.dart';

/// 4/5 Complete

class IconThemeBuilder extends ThemeBuilderService {
  IconThemeBuilder(List<Style> styles)
      : super(styles
            .where(
                (element) => element.compareTags([StyleTag.all, StyleTag.icon]))
            .toList());

  @override
  generate(dynamic theme) {
    if (theme == null) {
      if (style != null) {
        return IconThemeData(
          color: style!.background,
          opacity: style!.opacity,
          size: style!.size,
        );
      } else {
        return null;
      }
    } else {
      if (style != null) {
        return (theme as IconThemeData).copyWith(
          color: style!.background ?? theme.color,
          opacity: style!.opacity ?? theme.opacity,
          size: style!.size ?? theme.size,
        );
      } else {
        return theme as IconThemeData;
      }
    }
  }

  @override
  ThemeData mix(ThemeData data) {
    return data.copyWith(iconTheme: generate(data.iconTheme));
  }
}
