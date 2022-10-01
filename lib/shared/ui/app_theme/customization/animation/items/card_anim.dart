import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/animation_controller.dart';
import '../res/animation_keys.dart';

class CardAnimation extends StatelessWidget {
  const CardAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      CustomAnimationController _animationController =
          Get.find<CustomAnimationController>(
              tag: AnimationKeys.CARD_ANIM_DURATION);
      log("message");
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Transform.rotate(
          angle: 1.5708,
          child: Container(
            transform: Matrix4.identity()
              ..scale(_animationController.rxAnimationValue.value, 1.0, 5),
            alignment: FractionalOffset.center,
            height: 250,
            width: 250,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    });
  }
}
