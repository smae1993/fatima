import 'package:fatima/ui/buttons/fatima_button.dart';
import 'package:flutter/material.dart';

class TextBtn extends FatimaBtn {
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
