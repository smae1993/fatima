import 'package:example/routes.dart';
import 'package:fatima/fatima.dart';
import 'package:fatima/ui/fatima_ui_config.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Storage.init();
  Storage().erase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FatimaApp(
      title: 'Fatima Documentation',
      defaultTransition: Transition.circularReveal,
      textDirection: TextDirection.ltr,

      // color: Colors.blueGrey,
      uiConfig: UIConfig(),
      // scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,

      pages: routes,
    );
  }
}
