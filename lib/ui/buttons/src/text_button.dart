import 'package:fatima/ui/buttons/src/button.dart';
import 'package:flutter/material.dart';
import 'package:fatima/ui/fatima_ui.dart' as ui;

class TextBtn extends ui.Button {
  TextBtn({
    super.key,
    super.type,
    super.config,
    super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: generateChild(),
    );
  }
}
