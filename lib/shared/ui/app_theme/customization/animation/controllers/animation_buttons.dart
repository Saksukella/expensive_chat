import 'package:flutter/material.dart';

import '../controllers/animation_controller.dart';

class AnimationControlButtons extends StatelessWidget {
  const AnimationControlButtons({super.key, required this.controller});

  final CustomAnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                controller.getController.duration =
                    Duration(milliseconds: controller.getDuration);
                controller.getController.isAnimating
                    ? controller.getController.stop()
                    : controller.getController.forward();
              },
              icon: Icon(Icons.pause)),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                controller.getController.duration =
                    Duration(milliseconds: controller.getDuration);
                controller.getController.reset();
                controller.getController.forward();
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
    );
  }
}
