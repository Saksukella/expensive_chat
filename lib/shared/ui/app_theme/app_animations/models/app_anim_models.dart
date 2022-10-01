import 'package:expensive_chat/shared/res/app_default.dart';
import 'package:expensive_chat/shared/services/preferences/utils/pref_operations.dart';
import 'package:flutter/material.dart';

import '../../customization/animation/Utils/values.dart';

class AppAnimModels {
  late int animDuration;
  late Curve animCurve;
  List<String> keys;

  AppAnimModels({
    required this.keys,
  }) {
    this.animDuration = readPrefInt(keys[0]) ?? SResourses.DEFAULT_DURATION;
    this.animCurve = getCurveFromString(readPrefString(keys[1]));
  }
}
