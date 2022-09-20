import 'package:flutter/material.dart';

class ResponsiveDrawer extends StatelessWidget {
  const ResponsiveDrawer(
      {required this.body, this.drawer, this.appbar, super.key});

  final Widget body;
  final Widget? drawer;
  final AppBar? appbar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (drawer != null && MediaQuery.of(context).size.width > 768)
          ? null
          : appbar,
      body: (drawer != null && MediaQuery.of(context).size.width > 768)
          ? Row(
              children: [
                drawer!,
                Expanded(
                    child: Column(
                  children: [appbar!, Expanded(child: body)],
                ))
              ],
            )
          : body,
    );
  }

  Widget _scaffold() {
    return Scaffold();
  }
}
