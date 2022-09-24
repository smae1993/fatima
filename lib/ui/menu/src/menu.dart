import 'package:flutter/material.dart';
import 'package:fatima/ui/fatima_ui.dart' as ui;

class Menu extends StatelessWidget {
  const Menu({required this.items, super.key, this.header, this.selected});
  final Widget? header;
  final List<ui.MenuItem> items;
  final String? selected;
  @override
  Widget build(BuildContext context) {
    checkSelected(items);
    return ListView(children: [
      if (header != null) header!,
      Column(
        children: items,
      ),
    ]);
  }

  void checkSelected(List<ui.MenuItem> items) {
    items.forEach((element) {
      element.selected = isSelected(element);
      if (element.children != null) checkSelected(element.children!);
    });
  }

  bool isSelected(ui.MenuItem item) {
    return item.title == selected ||
        (item.children != null &&
            item.children!.any((element) => isSelected(element)));
  }
}
