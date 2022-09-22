import 'package:example/controllers/home_controller.dart';
import 'package:fatima/fatima.dart';
import 'package:fatima/state_manager/src/view/updater.dart';
import 'package:fatima/ui/widgets/responsive_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends View<HomeController> {
  HomePage() {
    Fatima.register(HomeController());
    // Get.to(page)
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveDrawer(
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
