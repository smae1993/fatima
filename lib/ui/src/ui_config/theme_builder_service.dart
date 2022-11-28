import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

abstract class ThemeBuilderService {
  ThemeBuilderService(List<Style> styles) {
    style = _merge(styles);
  }
  Style? style;
  dynamic generate(dynamic theme);
  ThemeData mix(ThemeData data);
  Style? _merge(List<Style> styles) {
    // var controller = Fatima.find<FatimaController>();
    // Style mergedStyle = Style(mode: controller.uiConfig.themeMode!);
    Style? mergedStyle = styles.firstOrNull;
    for (var element in styles) {
      mergedStyle!.merge(element);
    }
    return mergedStyle;
  }
}
