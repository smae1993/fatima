import 'package:example/controllers/home_controller.dart';
import 'package:example/views/layouts/app_layout.dart';
import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';
import 'package:fatima/ui/fatima_ui.dart' as ui;

class HomePage extends View<HomeController> {
  HomePage() {
    Fatima.register(HomeController());
    // Get.to(page)
  }
  @override
  Widget build(BuildContext context) {
    return AppLayout(selected: "Home", body: Container());
  }
}
