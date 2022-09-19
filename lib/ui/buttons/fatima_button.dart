import 'package:fatima/fatima.dart';
import 'package:fatima/ui/buttons/contained_button.dart';
import 'package:fatima/ui/buttons/fatima_button_config.dart';
import 'package:fatima/ui/buttons/fatima_button_type.dart';
import 'package:fatima/ui/buttons/glass_button.dart';
import 'package:fatima/ui/buttons/outlined_button.dart';
import 'package:fatima/ui/buttons/text_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FatimaBtn extends StatelessWidget {
  FatimaBtn({
    super.key,
    this.config,
    this.type,
    this.onPressed,
    this.child,
    this.text,
    this.icon,
  }) {
    config ??= fatimaConfig.btnConfig;
    if (type != null) {
      config!.type = type!;
    }
  }

  Function()? onPressed;

  FatimaBtnConfig? config;
  final FatimaBtnType? type;
  Widget? child;
  String? text;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    switch (config!.type) {
      case FatimaBtnType.contained:
        return ContainedBtn(
          onPressed: onPressed,
        );
      case FatimaBtnType.text:
        return TextBtn();
      case FatimaBtnType.outlined:
        return OutlineBtn();
      case FatimaBtnType.glass:
        return FatimaGlassButton();
      default:
        return ContainedBtn();
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
