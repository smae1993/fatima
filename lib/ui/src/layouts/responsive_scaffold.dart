import 'package:flutter/material.dart';
// import 'package:fatima/ui/fatima_ui.dart' as ui;

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold(
      {required this.body,
      this.drawer,
      this.padding,
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

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    bool fixedDrawer =
        (drawer != null && MediaQuery.of(context).size.width > 768);

    var appBar = PreferredSize(
        preferredSize: const Size(0, 66),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: AppBar(
            // automaticallyImplyLeading: true,
            title: title,
            actions: actions,
          ),
        ));

    // var appBar = ui.AppBarHolder(
    //   AppBar(
    //     // automaticallyImplyLeading: true,
    //     title: title,
    //     actions: actions,
    //   ),
    //   padding: const EdgeInsets.all(5),
    // );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: fixedDrawer ? null : appBar,
      body: fixedDrawer
          ? Row(
              children: [
                drawer!,
                Expanded(
                    child: Column(
                  children: [appBar, Expanded(child: body)],
                ))
              ],
            )
          : body,
      drawer: fixedDrawer ? null : drawer,
    );
  }
}
