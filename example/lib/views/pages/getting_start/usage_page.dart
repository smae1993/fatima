import 'package:example/views/layouts/app_layout.dart';
import 'package:flutter/material.dart';

class UsagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
        body: Container(
      child: Center(child: Text("Usage")),
    ));
  }
}
