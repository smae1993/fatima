import 'package:flutter/material.dart';
import 'package:fatima/ui/fatima_ui.dart' as ui;

class Menu extends StatelessWidget {
  const Menu({required this.items, super.key, this.header});
  final Widget? header;
  final List<ui.MenuItem> items;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      if (header != null) header!,
      Column(
        children: items,
      ),
    ]);
  }
}
