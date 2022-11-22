import 'package:flutter/material.dart';

class FaCard extends Card {
  const FaCard({
    super.key,
    super.color,
    super.shadowColor,
    super.surfaceTintColor,
    super.elevation,
    super.shape,
    super.borderOnForeground = true,
    super.margin,
    super.clipBehavior,
    super.child,
    super.semanticContainer = true,
  });

  @override
  Widget build(BuildContext context) {
    print("object");
    return super.build(context);
  }
}
