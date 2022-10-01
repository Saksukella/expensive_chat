import 'package:expensive_chat/shared/res/app_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/preferences/utils/pref_operations.dart';
import '../res/theme_keys.dart';
import '../themes.dart';

Themes get themes => Get.find<Themes>();

ThemeData get theme => Get.find<Themes>().themeData;

bool themeUtilsIsDark() {
  return readPrefBool(ThemeKeys.DARK_MODE) ?? SResourses.DARK_MODE;
}

void themeUtilsSetDark(bool value) {
  writePrefBool(ThemeKeys.DARK_MODE, value);
}

int themeUtilsGetTextSize() {
  return readPrefInt(ThemeKeys.TEXT_SIZE) ?? SResourses.TEXT_SIZE;
}

void themeUtilsSetTextSize(int value) {
  writePrefInt(ThemeKeys.TEXT_SIZE, value);
}

int themeUtilsSchemeIndex() {
  return readPrefInt(ThemeKeys.SCHEME_INDEX) ?? SResourses.SCHEME_INDEX;
}

void themeUtilsSetSchemeIndex(int value) {
  writePrefInt(ThemeKeys.SCHEME_INDEX, value);
}
