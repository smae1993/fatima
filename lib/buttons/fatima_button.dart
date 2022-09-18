import 'package:fatima/buttons/contained_button.dart';
import 'package:fatima/buttons/fatima_button_config.dart';
import 'package:fatima/buttons/fatima_button_type.dart';
import 'package:fatima/buttons/glass_button.dart';
import 'package:fatima/buttons/outlined_button.dart';
import 'package:fatima/buttons/text_button.dart';
import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FButton extends StatelessWidget {
  FButton({
    super.key,
    this.config,
    this.type,
    this.onPressed,
  }) {
    config ??= fatimaConfig.buttonConfig;
    if (type != null) {
      config!.type = type!;
    }
  }

  Function()? onPressed;

  FButtonConfig? config;
  final FButtonType? type;
  Widget? child;
  String? text;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    switch (config!.type) {
      case FButtonType.contained:
        return FContainedButton(
          onPressed: onPressed,
        );
      case FButtonType.text:
        return FTextButton();
      case FButtonType.outlined:
        return FOutlinedButton();
      case FButtonType.glass:
        return FGlassButton();
    }
  }

  Widget generateChild() {
    return child ??
        Row(
          children: [
            Text(text ?? "Button"),
          ],
        );
  }
}
