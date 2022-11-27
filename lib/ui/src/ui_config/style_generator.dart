import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

class StyleGenerator<T> {
  List<Style> styles = [];
  late Style mergedStyle;

  StyleGenerator() {
    var controller = Fatima.find<FatimaController>();
    mergedStyle = Style(mode: controller.uiConfig.themeMode!);
    for (var element in styles) {
      mergedStyle.merge(element);
    }
  }

  T genetate() {
    return "" as T;
  }
}
