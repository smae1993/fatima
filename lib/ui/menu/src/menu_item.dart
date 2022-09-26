import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  MenuItem(
      {required this.title,
      this.selected = false,
      this.onPressed,
      this.children,
      super.key});
  final List<MenuItem>? children;
  final String? title;
  final Function()? onPressed;
  bool selected;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(bottom: 5),
        child: (children != null && children!.isNotEmpty)
            ? GestureDetector(
                onTap: onPressed,
                child: ExpansionTile(
                  initiallyExpanded: selected,
                  title: Text(title ?? ""),
                  children: children!,
                ),
              )
            : ListTile(
                selected: selected,
                title: Text(title ?? ""),
                onTap: onPressed,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                // style: ListTileStyle.list,
              ));
  }
}
