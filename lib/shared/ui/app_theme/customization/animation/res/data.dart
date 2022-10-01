import 'package:expensive_chat/shared/ui/app_theme/customization/animation/items/transition_anim.dart';
import 'package:flutter/material.dart';

import '../items/card_anim.dart';
import '../items/expansion_anim.dart';
import '../models/animation_key_widget.dart';
import 'animation_keys.dart';

List<List<String>> anim_keys = [
  [
    AnimationKeys.CARD_ANIM_DURATION,
    AnimationKeys.CARD_ANIM_CURVE,
  ],
  [
    AnimationKeys.EXPANSION_ANIM_DURATION,
    AnimationKeys.EXPANSION_ANIM_CURVE,
  ],
  [
    AnimationKeys.TRANSITION_ANIM_DURATION,
    AnimationKeys.TRANSITION_ANIM_CURVE,
  ],
];
List<AnimModels> anim_models = [
  AnimModels(
    title: "Card",
    iconData: Icons.calendar_view_day,
    keys: anim_keys[0],
    frameHeight: 350,
    widget: CardAnimation(),
  ),
  AnimModels(
    title: "Expansion",
    iconData: Icons.expand_circle_down,
    curveEnabled: false,
    visibleControls: false,
    keys: anim_keys[1],
    widget: ExpansionAnimation(),
  ),
  AnimModels(
    title: "Transition",
    iconData: Icons.last_page_outlined,
    frameHeight: 150,
    maxDuration: 1000,
    curveEnabled: false,
    visibleControls: false,
    keys: anim_keys[2],
    widget: TransitionAnimation(),
  ),
];
