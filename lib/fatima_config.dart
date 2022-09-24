import 'package:fatima/fatima_controller.dart';
import 'package:fatima/ui/buttons/fatima_button_config.dart';
import 'package:fatima/ui/cards/fatima_card_config.dart';
import 'package:fatima/ui/text_fields/fatima_text_field_config.dart';
import 'package:get/get.dart';

class FatimaConfig {
  FatimaConfig() {
    Get.put(FatimaController());
  }
  ButtonConfig btnConfig = ButtonConfig();
  CardConfig cardConfig = CardConfig();
  FatimaTextFieldConfig textFieldConfig = FatimaTextFieldConfig();

  void setButtonsConfig(ButtonConfig config) {
    btnConfig = config;
  }

  void setPrimaryColor() {}

  void setDarkMode() {}
}
