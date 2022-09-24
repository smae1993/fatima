import 'package:fatima/ui/buttons/src/button.dart';
import 'package:flutter/material.dart';
import 'package:fatima/ui/fatima_ui.dart' as ui;

class FatimaProgressBtn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FatimaProgressBtnState();
}

class _FatimaProgressBtnState extends State<FatimaProgressBtn> {
  bool progressing = false;

  @override
  Widget build(BuildContext context) {
    return ui.Button();
  }
}
