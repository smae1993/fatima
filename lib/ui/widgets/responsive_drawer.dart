import 'package:flutter/material.dart';

class FatimaResponsiveDrawerView extends StatelessWidget {
  const FatimaResponsiveDrawerView({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
