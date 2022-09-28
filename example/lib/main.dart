import 'package:example/routes.dart';
import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Storage.init();

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
      // color: Colors.blueGrey,
      themeMode: ThemeMode.dark,
      // scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,

      fatimaPages: routes,
    );
  }
}
