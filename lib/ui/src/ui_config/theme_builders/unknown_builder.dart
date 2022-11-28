import 'package:fatima/ui/src/ui_config/theme_builder_service.dart';
import 'package:flutter/material.dart';

class UnknownBuilder extends ThemeBuilderService {
  UnknownBuilder(super.styles);

  @override
  generate(dynamic theme) => null;

  @override
  ThemeData mix(ThemeData data) => data;
}
