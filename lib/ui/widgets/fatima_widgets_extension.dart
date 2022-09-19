import 'package:fatima/fatima_interface.dart';
import 'package:fatima/ui/widgets/responsive_drawer.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on FatimaInterface {
  FatimaResponsiveDrawerView responsiveDrawerView({required Widget child}) {
    return FatimaResponsiveDrawerView(
      child: child,
    );
  }
}
