import 'package:example/constants/images.dart';
import 'package:fatima/fatima.dart';
import 'package:fatima/state_manager/src/view/updater.dart';
import 'package:fatima/ui/fatima_ui.dart' as ui;
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({required this.body, required this.selected, super.key});
  final Widget body;
  final String selected;
  @override
  Widget build(BuildContext context) {
    return ui.FaResponsiveScaffold(
      title: Text(selected),
      padding: const EdgeInsets.all(10),
      actions: [
        IconButton(onPressed: (() {
          Fatima.toggleThemeMode();
        }), icon: Updater<FatimaController>(
          builder: (controller) {
            return Icon(controller.uiConfig.themeMode == ThemeMode.dark
                ? Icons.sunny
                : Icons.dark_mode);
          },
        )),
        IconButton(onPressed: (() {
          Fatima.setPrimaryColor(Colors.blueGrey);
        }), icon: Updater<FatimaController>(
          builder: (controller) {
            return Icon(Icons.format_paint_rounded);
          },
        ))
      ],
      drawer: Drawer(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: ui.Menu(
                selected: selected,
                header: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      // width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.logo.path(),
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Fatima Flutter Kit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        "Version ${Fatima.version}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
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
                    onPressed: () => Fatima.offNamed("/"),
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
                        onPressed: () => Fatima.offNamed("/routing_system"),
                      ),
                      ui.MenuItem(
                        title: "Page",
                        onPressed: () => Fatima.offNamed("/page"),
                      ),
                      ui.MenuItem(
                        title: "Dialog",
                        onPressed: () => Fatima.offNamed("/dialog"),
                      ),
                      ui.MenuItem(
                        title: "Snackbar",
                        onPressed: () => Fatima.offNamed("/snackbar"),
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

                  ///------------------------------------------ State Management
                  ui.MenuItem(
                    title: "State Management",
                    children: [
                      ui.MenuItem(
                        title: "MVC Structure",
                      ),
                      ui.MenuItem(
                        title: "Controller",
                      ),
                      ui.MenuItem(
                        title: "Updater",
                      ),
                    ],
                  ),

                  ///------------------------------------------ Storage
                  ui.MenuItem(
                    title: "Storage",
                  ),
                ],
              ))),
      body: body,
    );
  }
}
