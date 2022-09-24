import 'package:flutter/material.dart';
import 'package:fatima/ui/fatima_ui.dart' as ui;

class Menu extends StatelessWidget {
  const Menu({required this.items, super.key, this.header, this.selected});
  final Widget? header;
  final List<ui.MenuItem> items;
  final String? selected;
  @override
  Widget build(BuildContext context) {
    // items.forEach((element) {element.title ==})
    return ListView(children: [
      if (header != null) header!,
      Column(
        children: items,
      ),
    ]);
  }

  // bool checkSelected (ui.MenuItem item){

  // }

}
