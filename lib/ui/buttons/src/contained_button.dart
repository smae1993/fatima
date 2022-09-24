import 'package:flutter/material.dart';
import 'package:fatima/ui/fatima_ui.dart' as ui;

// ignore: must_be_immutable
class ContainedBtn extends ui.Button {
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
