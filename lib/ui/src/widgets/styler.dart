import 'package:fatima/fatima.dart';
import 'package:fatima/ui/src/ui_config/theme_builder.dart';
import 'package:flutter/material.dart';

class Styler<T extends Widget> extends StatelessWidget {
  const Styler({required this.child, required this.styles, super.key});
  final T child;
  final List<Style> styles;

  @override
  Widget build(BuildContext context) {
    var data = ThemeBuilder<T>(styles: styles).mix(Theme.of(context));
    return Theme(data: data, child: child);
  }
}
