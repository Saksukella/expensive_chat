import 'package:expensive_chat/shared/res/app_default.dart';
import 'package:flutter/material.dart';

import '../../../../../services/preferences/utils/pref_operations.dart';
import '../../../theme/utils/theme_utils.dart';
import '../res/theme_keys.dart';
import 'default_colors.dart';

int themeUtils_getSchemeIndex() {
  return readPrefInt(ThemeKeys.SCHEME_COLOR) ?? SResourses.SCHEME_INDEX;
}

Color themeUtils_getTextColor() {
  String key =
      themes.isDark ? ThemeKeys.TEXT_COLOR_DARK : ThemeKeys.TEXT_COLOR_LIGHT;

  return Color(readPrefInt(key) ?? defaultThemeUtils_TextColor().value);
}

Color themeUtils_getIconColor() {
  String key =
      themes.isDark ? ThemeKeys.ICON_COLOR_DARK : ThemeKeys.ICON_COLOR_LIGHT;

  return Color(readPrefInt(key) ?? defaultThemeUtils_IconColor().value);
}

Color themeUtils_getCardColor() {
  String key =
      themes.isDark ? ThemeKeys.CARD_COLOR_DARK : ThemeKeys.CARD_COLOR_LIGHT;
  return Color(readPrefInt(key) ?? defaultThemeUtils_CardColor().value);
}

Color themeUtils_getBackgroundColor() {
  String key = themes.isDark
      ? ThemeKeys.BACKGROUND_COLOR_DARK
      : ThemeKeys.BACKGROUND_COLOR_LIGHT;
  return Color(readPrefInt(key) ?? defaultThemeUtils_BackgroundColor().value);
}

Color themeUtils_getExpansionColor() {
  String key = themes.isDark
      ? ThemeKeys.EXPANSION_COLOR_DARK
      : ThemeKeys.EXPANSION_COLOR_LIGHT;
  return Color(readPrefInt(key) ?? defaultThemeUtils_ExpansionColor().value);
}

Color themeUtils_getListTileColor() {
  String key = themes.isDark
      ? ThemeKeys.LISTTILE_COLOR_DARK
      : ThemeKeys.LISTTILE_COLOR_LIGHT;
  return Color(readPrefInt(key) ?? defaultThemeUtils_ListTileColor().value);
}

Color themeUtils_getListTileIconColor() {
  String key = themes.isDark
      ? ThemeKeys.LISTTILE_ICONCOLOR_DARK
      : ThemeKeys.LISTTILE_ICONCOLOR_LIGHT;
  return Color(readPrefInt(key) ?? defaultThemeUtils_ListTileIconColor().value);
}

void themeUtils_setTextColor(Color color) {
  String key =
      themes.isDark ? ThemeKeys.TEXT_COLOR_DARK : ThemeKeys.TEXT_COLOR_LIGHT;

  writePrefInt(key, color.value);
}

void themeUtils_setIconColor(Color color) {
  String key =
      themes.isDark ? ThemeKeys.ICON_COLOR_DARK : ThemeKeys.ICON_COLOR_LIGHT;

  writePrefInt(key, color.value);
}

void themeUtils_setCardColor(Color color) {
  String key =
      themes.isDark ? ThemeKeys.CARD_COLOR_DARK : ThemeKeys.CARD_COLOR_LIGHT;

  writePrefInt(key, color.value);
}

void themeUtils_setBackgroundColor(Color color) {
  String key = themes.isDark
      ? ThemeKeys.BACKGROUND_COLOR_DARK
      : ThemeKeys.BACKGROUND_COLOR_LIGHT;
  writePrefInt(key, color.value);
}

void themeUtils_setExpansionColor(Color color) {
  String key = themes.isDark
      ? ThemeKeys.EXPANSION_COLOR_DARK
      : ThemeKeys.EXPANSION_COLOR_LIGHT;
  writePrefInt(key, color.value);
}

void themeUtils_setListTileColor(Color color) {
  String key = themes.isDark
      ? ThemeKeys.LISTTILE_COLOR_DARK
      : ThemeKeys.LISTTILE_COLOR_LIGHT;
  writePrefInt(key, color.value);
}

void themeUtils_setListTileIconColor(Color color) {
  String key = themes.isDark
      ? ThemeKeys.LISTTILE_ICONCOLOR_DARK
      : ThemeKeys.LISTTILE_ICONCOLOR_LIGHT;
  writePrefInt(key, color.value);
}

void themeUtils_setSchemeIndex(int index) {
  writePrefInt(ThemeKeys.SCHEME_COLOR, index);
}
