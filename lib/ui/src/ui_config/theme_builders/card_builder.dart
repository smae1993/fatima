import 'package:fatima/ui/src/ui_config/style.dart';
import 'package:fatima/ui/src/ui_config/theme_builder_service.dart';
import 'package:flutter/material.dart';

class CardThemeBuilder extends ThemeBuilderService {
  CardThemeBuilder(List<Style> styles)
      : super(styles
            .where(
                (element) => element.compareTags([StyleTag.all, StyleTag.card]))
            .toList());

  @override
  generate(dynamic theme) {
    if (theme == null) {
      if (style != null) {
        return CardTheme(
          color: style!.background,
          shape: style!.shape(),
          elevation: style!.elevation,
          margin: style!.margin,
          shadowColor: style!.shadow,
        );
      } else {
        return null;
      }
    } else {
      if (style != null) {
        return (theme as CardTheme).copyWith(
          color: style!.background ?? theme.color,
          shape: style!.shape() ?? theme.shape,
          elevation: style!.elevation ?? theme.elevation,
          margin: style!.margin ?? theme.margin,
          shadowColor: style!.shadow ?? theme.shadowColor,
        );
      } else {
        return theme as CardTheme;
      }
    }
  }

  @override
  ThemeData mix(ThemeData data) {
    return data.copyWith(cardTheme: generate(data.cardTheme));
  }
}
