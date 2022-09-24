import 'package:example/views/layouts/app_layout.dart';
import 'package:flutter/material.dart';

class OverViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
        selected: "Overview",
        body: Container(
          child: Center(child: Text("OverView")),
        ));
  }
}
