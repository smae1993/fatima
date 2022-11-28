import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

UIConfig uiConfig = UIConfig(
    // defStyle: Style(),
    styles: []);

Style defaultLight =
    Style(mode: ThemeMode.light, tag: StyleTag.main, primary: Colors.brown);
Style defaultDark =
    Style(mode: ThemeMode.dark, tag: StyleTag.main, primary: Colors.pinkAccent);

Style appBarLight = Style(
  mode: ThemeMode.light,
  tag: StyleTag.appBar,
  background: Colors.amber,
);

Style appBarDark = Style(
  mode: ThemeMode.dark,
  tag: StyleTag.appBar,
  background: Colors.green,
);
