import 'package:example/views/pages/getting_start/installation_page.dart';
import 'package:example/views/pages/getting_start/usage_page.dart';
import 'package:example/views/pages/over_view_page.dart';
import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // fatimaConfig = FatimaConfig();
  await Storage.init();
  // await Storage().erase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   routes: ,
    // );

    return FatimaApp(
      title: 'Fatima Framework',
      defaultTransition: Transition.circularReveal,
      // color: Colors.blueGrey,
      themeMode: ThemeMode.dark,

      // scrollBehavior: MyCustomScrollBehavior(),
      // textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      // // initialBinding: DefaultBinding(),
      // theme: themeController.darkTheme,
      // darkTheme: themeController.darkTheme,
      // themeMode: themeController.theme,
      // initialRoute: '/',
      fatimaPages: [
        FatimaPage(
          name: '/',
          page: () => const OverViewPage(),
        ),
        FatimaPage(
          name: '/installation',
          page: () => const InstallationPage(),
        ),
        FatimaPage(
          name: '/usage',
          page: () => const UsagePage(),
        ),
        // GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}
