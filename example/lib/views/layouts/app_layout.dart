import 'package:fatima/ui/fatima_ui.dart' as ui;
// import 'package:fatima/ui/widgets/responsive_drawer.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({required this.body, super.key});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    // Image.asset(name)
    return ui.ResponsiveScaffold(
      drawer: const Drawer(
          // backgroundColor: Colors.black12,
          child: Padding(
              padding: const EdgeInsets.all(5),
              child: ui.Menu(
                items: [
                  ui.MenuItem(
                    title: "Overview",
                  )
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
      appbar: AppBar(),
    );
  }
}
