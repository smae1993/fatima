import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({this.title, this.children, super.key});
  final List<MenuItem>? children;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(bottom: 5),
        child: (children != null && children!.isNotEmpty)
            ? ExpansionTile(
                title: Text(title ?? ""),
                children: children!,
              )
            : ListTile(
                title: Text(title ?? ""),
                onTap: () {},
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                // style: ListTileStyle.list,
              ));
  }
}
