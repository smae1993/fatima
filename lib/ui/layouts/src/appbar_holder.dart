import 'package:flutter/material.dart';

class AppBarHolder extends StatelessWidget implements PreferredSize {
  const AppBarHolder(this.appBar, {this.padding, super.key});
  final AppBar appBar;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: appBar,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(0, 0);
}
