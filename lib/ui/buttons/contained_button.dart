import 'package:fatima/ui/buttons/fatima_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainedBtn extends FatimaBtn {
  ContainedBtn(
      {super.key,
      super.type,
      super.config,
      super.onPressed,
      super.child,
      super.text,
      super.icon})
      : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: generateChild());
  }
}
