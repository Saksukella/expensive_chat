import 'package:expensive_chat/shared/res/app_default.dart';
import 'package:flutter/material.dart';

import '../../../../../services/preferences/utils/pref_operations.dart';
import '../res/animation_keys.dart';
import '../res/curve_string.dart';

bool getAnimationUtils_isAnimationEnabled() {
  return readPrefBool(AnimationKeys.animation_enabled) ?? true;
}

Curve getCurveFromString(String? curveName) {
  if (curveName == null) curveName = SResourses.DEFAULT_CURVE;
  return curveStrings
      .where((element) => element.curveName == curveName)
      .first
      .curve;
}

String getStringFromCurve(Curve curve) {
  return curveStrings
      .where((element) => element.curve == curve)
      .first
      .curveName;
}
