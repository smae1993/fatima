import 'package:fatima/buttons/fatima_button.dart';
import 'package:fatima/fatima_interface.dart';

extension ButtonExtension on FatimaInterface {
  FButton button({Function()? onPressed}) {
    return FButton(
      onPressed: onPressed,
    );
  }

  FButton progressButton() {
    return FButton();
  }
}
