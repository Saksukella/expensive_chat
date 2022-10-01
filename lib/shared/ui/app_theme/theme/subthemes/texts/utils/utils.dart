import 'package:expensive_chat/shared/res/app_default.dart';
import 'package:expensive_chat/shared/services/preferences/utils/pref_operations.dart';
import 'package:expensive_chat/shared/ui/app_theme/theme/subthemes/texts/res/data.dart';
import 'package:expensive_chat/shared/ui/app_theme/theme/subthemes/texts/res/keys.dart';
import 'package:flutter/cupertino.dart';

TextStyle textStyleUtils_textStyle(String? styleText) {
  String t = styleText != null ? styleText : textStyleUtils_textStyleName();
  late TextStyle textStyle;
  for (var a in appTextStyles) {
    if (a.name == t) {
      textStyle = a.textStyle;
    }
  }
  return textStyle;
}

String textStyleUtils_textStyleName() {
  return readPrefString(TextStyleKeys.TEXT_STYLE) ??
      SResourses.DEFAULT_TEXT_STYLE;
}

void textStyleUtils_setTextStyle(String styleText) {
  writePrefString(TextStyleKeys.TEXT_STYLE, styleText);
}
