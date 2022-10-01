import 'package:flutter/material.dart';

class CurveString {
  String curveName;
  Curve curve;

  CurveString(this.curveName, this.curve);
}

final List<CurveString> curveStrings = [
  CurveString("BounceIn", Curves.bounceIn),
  CurveString("BounceInOut", Curves.bounceInOut),
  CurveString("BounceOut", Curves.bounceOut),
  CurveString("EaseIn", Curves.easeIn),
  CurveString("EaseInOut", Curves.easeInOut),
  CurveString("EaseOut", Curves.easeOut),
  CurveString("FastOutSlowIn", Curves.fastOutSlowIn),
  CurveString("Linear", Curves.linear),
  CurveString("SlowMiddle", Curves.slowMiddle),
  CurveString("Decelerate", Curves.decelerate),
  CurveString("ElasticIn", Curves.elasticIn),
  CurveString("ElasticOut", Curves.elasticOut),
  CurveString("EaseInBack", Curves.easeInBack),
  CurveString("EaseInCirc", Curves.easeInCirc),
  CurveString("EaseInCubic", Curves.easeInCubic),
  CurveString("EaseInExpo", Curves.easeInExpo),
  CurveString("EaseInQuad", Curves.easeInQuad),
  CurveString("EaseInQuart", Curves.easeInQuart),
  CurveString("EaseInQuint", Curves.easeInQuint),
  CurveString("EaseInSine", Curves.easeInSine),
  CurveString("EaseOutBack", Curves.easeOutBack),
  CurveString("EaseOutCirc", Curves.easeOutCirc),
  CurveString("EaseOutCubic", Curves.easeOutCubic),
  CurveString("EaseOutExpo", Curves.easeOutExpo),
  CurveString("EaseOutQuad", Curves.easeOutQuad),
  CurveString("EaseOutQuart", Curves.easeOutQuart),
  CurveString("EaseOutQuint", Curves.easeOutQuint),
  CurveString("EaseOutSine", Curves.easeOutSine),
  CurveString("ElasticInOut", Curves.elasticInOut),
];
