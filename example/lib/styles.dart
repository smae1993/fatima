import 'package:fatima/fatima.dart';
import 'package:flutter/material.dart';

UIConfig uiConfig = UIConfig(
    // defStyle: Style(),
    styles: [appBarDark, appBarLight]);

Style defaultLight = LightStyle(primary: Colors.brown);
Style defaultDark = DarkStyle(primary: Colors.pinkAccent);

Style appBarLight = LightStyle(
  tag: StyleTag.appBar,
  background: Colors.amber,
);

Style appBarDark = DarkStyle(
  tag: StyleTag.appBar,
  background: Colors.green,
);
