import 'dart:async';

import 'package:fatima/fatima.dart';

class HomeController extends Controller {
  HomeController() {
    startTimer();
  }
  int i = 0;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      i++;
      update();
    });
  }
}
