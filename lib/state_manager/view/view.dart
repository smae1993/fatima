import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

abstract class View<T> extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => Fatima.find<T>(tag: tag)!;

  @override
  Widget build(BuildContext context);
}
