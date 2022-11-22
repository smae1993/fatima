import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

abstract class FatimaView<T> extends StatelessWidget {
  const FatimaView({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => Fatima.find<T>(tag: tag)!;

  @override
  Widget build(BuildContext context);
}
