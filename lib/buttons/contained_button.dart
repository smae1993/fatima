import 'package:fatima/buttons/fatima_button.dart';
import 'package:flutter/material.dart';

class FContainedButton extends FButton {
  FContainedButton({super.key, super.type, super.config, super.onPressed})
      : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: generateChild());
  }
}
