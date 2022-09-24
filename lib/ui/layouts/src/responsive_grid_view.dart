import 'package:flutter/material.dart';

class FatimaResponsiveGridView extends StatelessWidget {
  const FatimaResponsiveGridView({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
    );
  }
}
