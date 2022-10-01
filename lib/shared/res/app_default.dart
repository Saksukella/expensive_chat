import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SResourses {
  static final String APP_ICON_ASSETS = "assets/icons/launcher_icon.png";

  static final int DEFAULT_DURATION = 400;

  static final String DEFAULT_CURVE = "EaseInOut";

  static int SCHEME_INDEX = 0;

  static int TEXT_SIZE = 19;

  static bool DARK_MODE =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

  static String DEFAULT_TEXT_STYLE = "Norican";
}
