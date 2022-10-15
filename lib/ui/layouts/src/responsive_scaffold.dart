import 'package:flutter/material.dart';
// import 'package:fatima/ui/fatima_ui.dart' as ui;

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold(
      {required this.body,
      this.drawer,
      // this.appbar,
      this.backgroundColor,
      this.title,
      this.actions = const [],
      super.key});

  final Widget body;
  final Widget? drawer;
  // final AppBar? appbar;
  final Color? backgroundColor;
  final Widget? title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    bool fixedDrawer =
        (drawer != null && MediaQuery.of(context).size.width > 768);

    // actions.add(const SizedBox(
    //   width: 10,
    // ));

    AppBar appBar = AppBar(
      automaticallyImplyLeading: true,
      title: title,
      actions: actions,
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: fixedDrawer ? null : appBar,
      body: fixedDrawer
          ? Row(
              children: [
                drawer!,
                Expanded(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: appBar,
                    ),
                    Expanded(child: body)
                  ],
                ))
              ],
            )
          : body,
      drawer: fixedDrawer ? null : drawer,
    );
  }
}
