import 'package:example/views/layouts/app_layout.dart';
import 'package:flutter/material.dart';

class InstallationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
        selected: "Installation",
        body: Container(
          child: Center(child: Text("Installation")),
        ));
  }
}
