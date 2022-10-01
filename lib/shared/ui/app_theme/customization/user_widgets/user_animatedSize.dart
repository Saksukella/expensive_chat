import 'package:expensive_chat/shared/ui/app_theme/app_animations/utils/anim_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_animations/models/app_anim_models.dart';
import '../animation/res/animation_keys.dart';

class UserAnimatedSize extends StatelessWidget {
  const UserAnimatedSize({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      AppAnimModels animModels =
          anims.withKey(AnimationKeys.CARD_ANIM_DURATION);
      return AnimatedSize(
        duration: Duration(milliseconds: animModels.animDuration),
        curve: anims.animModels[0].animCurve,
        alignment: Alignment.topCenter,
        clipBehavior: Clip.antiAlias,
        child: child,
      );
    });
  }
}
