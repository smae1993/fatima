import 'package:fatima/ui/buttons/src/styles/fatima_button_style.dart';
import 'package:flutter/material.dart';

class OutlinedButtonStyle extends FatimaButtonStyle {
  OutlinedButtonStyle({
    super.radius = 15,
    super.fixedSize,
    super.side,
    super.textStyle,
    super.foregroundColor,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTintColor,
    super.elevation,
    super.padding,
    super.minimumSize,
    super.maximumSize,
    super.shape,
    super.mouseCursor,
    super.visualDensity,
    super.tapTargetSize,
    super.animationDuration,
    super.enableFeedback,
    super.alignment,
    super.splashFactory,
  }) : super() {
    backgroundColor = Colors.transparent;
    shadowColor = Colors.transparent;
    side = BorderSide(width: 1, color: foregroundColor!);
    generateStyle();
  }
}
