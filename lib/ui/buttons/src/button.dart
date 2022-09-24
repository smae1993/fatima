import 'package:fatima/fatima.dart';
import 'package:fatima/ui/buttons/fatima_button_config.dart';
import 'package:fatima/ui/buttons/fatima_button_type.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({
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

  ButtonConfig? config;
  final ButtonType? type;
  Widget? child;
  String? text;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: child);
    // switch (config!.type) {
    //   case ButtonType.contained:
    //     return ContainedBtn(
    //       onPressed: onPressed,
    //     );
    //   case ButtonType.text:
    //     return TextBtn();
    //   case ButtonType.outlined:
    //     return OutlineBtn();
    //   case ButtonType.glass:
    //     return FatimaGlassButton();
    //   default:
    //     return ContainedBtn();
    // }
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
