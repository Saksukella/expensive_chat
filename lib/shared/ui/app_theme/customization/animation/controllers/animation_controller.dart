import 'package:expensive_chat/shared/res/app_default.dart';
import 'package:expensive_chat/shared/ui/app_theme/app_animations/models/app_anim_models.dart';
import 'package:expensive_chat/shared/ui/app_theme/app_animations/utils/anim_utils.dart';
import 'package:expensive_chat/shared/ui/app_theme/customization/animation/Utils/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../services/preferences/utils/pref_operations.dart';
import '../res/curve_string.dart';

class CustomAnimationController extends GetxController {
  late Rx<AppAnimModels> model;

  final List<String> keys;
  AnimationController? _controller;
  Rx<double> rxAnimationValue = 0.0.obs;

  final String defaultCurveName = curveStrings[4].curveName;

  CustomAnimationController({
    required this.keys,
  }) {
    model = AppAnimModels(
      keys: keys,
    ).obs;
  }

  AnimationController get getController {
    return _controller!;
  }

  get getDuration => model.value.animDuration;

  String? get getCurveString {
    if (model.value.animCurve == null) return null;

    return getStringFromCurve(model.value.animCurve);
  }

  Curve? get getCurve {
    if (model.value.animCurve == null) return null;

    return model.value.animCurve;
  }

  set setCurve(String value) {
    model.update((val) {
      val!.animCurve = getCurveFromString(value);
    });
  }

  void setDuration(int duration) {
    model.update((val) {
      val!.animDuration = duration;
    });
  }

  void saveValues() {
    writePrefInt(keys[0], model.value.animDuration);
    if (keys.length > 1) {
      writePrefString(keys[1], getStringFromCurve(model.value.animCurve));
    }
    anims.updateAnimation = model.value;
  }

  void setAnimController(AnimationController controller) {
    this._controller = controller;
  }

  void reset() {
    setDuration(SResourses.DEFAULT_DURATION);
    setCurve = SResourses.DEFAULT_CURVE;
    saveValues();
  }

  void resetWith({int duration = 500, String? curve}) {
    setDuration(duration);
    setCurve = curve ?? defaultCurveName;
    saveValues();
  }
}
