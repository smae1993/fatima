import 'package:fatima/fatima_interface.dart';
import 'package:fatima/ui/buttons/fatima_button.dart';
import 'package:fatima/ui/fatima_ui_interface.dart';

extension ButtonExtension on FatimaUIInterface {
  FatimaBtn button({Function()? onPressed}) {
    return FatimaBtn(
      onPressed: onPressed,
    );
  }

  FatimaBtn progressButton() {
    return FatimaBtn();
  }
}
