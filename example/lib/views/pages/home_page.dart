import 'package:example/controllers/home_controller.dart';
import 'package:fatima/fatima.dart';
import 'package:fatima/state_manager/src/view/updater.dart';
import 'package:flutter/material.dart';
import 'package:fatima/ui/fatima_ui.dart' as ui;

class HomePage extends View<HomeController> {
  HomePage() {
    Fatima.register(HomeController());
    // Get.to(page)
  }
  @override
  Widget build(BuildContext context) {
    return ui.ResponsiveScaffold(
      appbar: AppBar(),
      drawer: Drawer(),
      body: Updater<HomeController>(
        builder: (controller) {
          return Text(controller.i.toString());
        },
      ),
    );
  }
}
