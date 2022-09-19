import 'package:fatima/ui/buttons/fatima_button.dart';
import 'package:flutter/material.dart';

class FatimaProgressBtn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FatimaProgressBtnState();
}

class _FatimaProgressBtnState extends State<FatimaProgressBtn> {
  bool progressing = false;

  @override
  Widget build(BuildContext context) {
    return FatimaBtn();
  }
}
