import 'package:flutter/material.dart';

class AnimModels {
  List<String> keys;
  Widget widget;

  String title;
  IconData iconData;
  bool curveEnabled;
  bool visibleControls;
  double maxDuration;
  double frameWidth;
  double frameHeight;

  AnimModels(
      {required this.keys,
      required this.widget,
      required this.title,
      required this.iconData,
      this.curveEnabled = true,
      this.visibleControls = true,
      this.maxDuration = 5000,
      this.frameHeight = 250,
      this.frameWidth = 200});
}
