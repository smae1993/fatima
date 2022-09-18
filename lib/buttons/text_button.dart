import 'package:fatima/buttons/fatima_button.dart';
import 'package:flutter/material.dart';

class FTextButton extends FButton {
  FTextButton({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
    );
  }
}
