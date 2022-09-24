import 'package:example/views/layouts/app_layout.dart';
import 'package:flutter/material.dart';

class UsagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
        selected: "Usage",
        body: Container(
          child: Center(child: Text("Usage")),
        ));
  }
}
