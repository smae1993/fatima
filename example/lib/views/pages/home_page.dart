import 'package:example/controllers/home_controller.dart';
import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

class HomePage extends View<HomeController> {
  HomePage() {
    Fatima.register(HomeController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Updater<HomeController>(
        builder: (controller) {
          return Text(controller.i.toString());
        },
      ),
    );
  }
}
