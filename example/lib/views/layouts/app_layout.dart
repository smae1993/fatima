import 'package:fatima/fatima.dart';
import 'package:fatima/state_manager/src/view/updater.dart';
import 'package:fatima/ui/fatima_ui.dart' as ui;
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({required this.body, super.key});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    // Image.asset(name)
    return ui.ResponsiveScaffold(
      // backgroundColor: Colors.grey.shade100,
      actions: [
        IconButton(onPressed: (() {
          Fatima.toggleThemeMode();
        }), icon: Updater<FatimaMaterialController>(
          builder: (controller) {
            return Icon(controller.themeMode == ThemeMode.dark
                ? Icons.sunny
                : Icons.dark_mode);
          },
        )),
        IconButton(onPressed: (() {
          Fatima.setPrimaryColor(Colors.blueGrey);
        }), icon: Updater<FatimaMaterialController>(
          builder: (controller) {
            return Icon(Icons.format_paint_rounded);
          },
        ))
      ],
      drawer: Drawer(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: ui.Menu(
                header: SizedBox(
                  height: 50,
                  // width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ui.Image(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Fatima Flutter Kit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                items: [
                  /// ------------------------------------------------- Overview
                  ui.MenuItem(
                    title: "Overview",
                    onPressed: () => Fatima.offNamed("/"),
                  ),

                  /// -------------------------------------------- Getting Start
                  ui.MenuItem(
                    title: "Getting Start",
                    children: [
                      ui.MenuItem(
                        title: "Installation",
                        onPressed: () => Fatima.offNamed("/installation"),
                      ),
                      ui.MenuItem(
                        title: "Usage",
                        onPressed: () => Fatima.offNamed("/usage"),
                      ),
                    ],
                  ),

                  ///------------------------------------------------ Navigation
                  ui.MenuItem(
                    title: "Navigation",
                    children: [
                      ui.MenuItem(
                        title: "Routing System",
                      ),
                      ui.MenuItem(
                        title: "Pages",
                      ),
                      ui.MenuItem(
                        title: "Dialogs",
                      ),
                      ui.MenuItem(
                        title: "Snackbar",
                      ),
                    ],
                  ),

                  ///------------------------------------------------ UI
                  ui.MenuItem(
                    title: "UI",
                    children: [
                      ui.MenuItem(
                        title: "Theme",
                      ),
                      ui.MenuItem(
                        title: "Layouts",
                      ),
                      ui.MenuItem(
                        title: "Buttons",
                      ),
                      ui.MenuItem(
                        title: "Cards",
                      ),
                    ],
                  ),
                ],
              )

              // ListView(
              //   children: <Widget>[
              //     DrawerHeader(
              //       padding: EdgeInsets.zero,
              //       child: Container(
              //         color: Colors.grey.shade400,
              //         child: Column(
              //             // children: [Image.asset("name")],
              //             ),
              //       ),
              //     ),
              //     ui.DrawerItem(
              //       title: "Overview",
              //     ),
              //     DrawerItem(
              //       title: "Getting Start",
              //       children: [
              //         DrawerItem(
              //           title: "Installation",
              //         ),
              //         DrawerItem(
              //           title: "Usage",
              //           children: [
              //             DrawerItem(
              //               title: "Installation",
              //             ),
              //             DrawerItem(
              //               title: "Usage",
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //     DrawerItem(
              //       title: "Getting Start",
              //       children: [
              //         DrawerItem(
              //           title: "Installation",
              //         ),
              //         DrawerItem(
              //           title: "Usage",
              //           children: [
              //             DrawerItem(
              //               title: "Installation",
              //             ),
              //             DrawerItem(
              //               title: "Usage",
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //     DrawerItem(
              //       title: "Getting Start",
              //       children: [
              //         DrawerItem(
              //           title: "Installation",
              //         ),
              //         DrawerItem(
              //           title: "Usage",
              //           children: [
              //             DrawerItem(
              //               title: "Installation",
              //             ),
              //             DrawerItem(
              //               title: "Usage",
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //     DrawerItem(
              //       title: "Getting Start",
              //       children: [
              //         DrawerItem(
              //           title: "Installation",
              //         ),
              //         DrawerItem(
              //           title: "Usage",
              //           children: [
              //             DrawerItem(
              //               title: "Installation",
              //             ),
              //             DrawerItem(
              //               title: "Usage",
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              )),
      body: body,
    );
  }
}
