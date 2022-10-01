import 'package:animate_do/animate_do.dart';
import 'package:expensive_chat/shared/ui/app_theme/customization/animation/models/animation_key_widget.dart';
import 'package:expensive_chat/shared/ui/native/chips/radio_chips.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../native/size/margins.dart';
import '../../theme/widgets/textbuttons.dart';
import '../controllers/animation_controller.dart';
import '../dialogs/animation_curve.dart';
import '../res/data.dart';
import 'animation_holder.dart';

class AnimationItem extends StatefulWidget {
  AnimationItem({
    super.key,
    required this.animModel,
  });

  final AnimModels animModel;

  @override
  State<AnimationItem> createState() => _AnimationItemState();
}

class _AnimationItemState extends State<AnimationItem> {
  void _radioInit(int duration) {
    if (duration == 900) {
      _radioButtonsController.selectIndex(0);
    } else if (duration == 650) {
      _radioButtonsController.selectIndex(1);
    } else if (duration == 500) {
      _radioButtonsController.selectIndex(2);
    } else if (duration == 400) {
      _radioButtonsController.selectIndex(3);
    } else if (duration == 250) {
      _radioButtonsController.selectIndex(4);
    } else {
      _radioButtonsController.selectIndex(-1);
    }
  }

  final _radioButtonsController = GroupButtonController();
  @override
  Widget build(BuildContext context) {
    CustomAnimationController _customAnimController =
        Get.find(tag: widget.animModel.keys[0]);

    return Obx(() {
      _radioInit(_customAnimController.getDuration);
      return ListView(
        padding: EdgeInsets.all(10),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          ResetRandomSaveButtons(
            reset: () {
              _customAnimController.reset();
            },
            save: () {
              _customAnimController.saveValues();
            },
            saveAll: () {
              saveAllValues();
            },
          ),
          AnimationHolder(
            model: widget.animModel,
          ),
          addVerticalMargin(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Animation Duration: ",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text:
                              "${_customAnimController.getDuration.toString()}ms",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _customAnimController.getDuration >= 400
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          addVerticalMargin(5),
          Visibility(
            visible: widget.animModel.curveEnabled,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Curves : ",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: "${_customAnimController.getCurveString}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    showDialog_Animation_Curve(_customAnimController);
                  },
                  child: Text("CHANGE"),
                ),
              ],
            ),
          ),
          addVerticalMargin(15),
          RadioChips(
            items: [
              "Slowest",
              "Slow",
              "Normal",
              "Fast",
              "Fastest",
            ],
            onSelected: (i, value) {
              if (i == 0) {
                _customAnimController.setDuration(900);
              } else if (i == 1) {
                _customAnimController.setDuration(650);
              } else if (i == 2) {
                _customAnimController.setDuration(500);
              } else if (i == 3) {
                _customAnimController.setDuration(400);
              } else if (i == 4) {
                _customAnimController.setDuration(250);
              }
            },
          ),
          /* GroupButton(
            isRadio: true,
            controller: _radioButtonsController,
            options: GroupButtonOptions(
              borderRadius: BorderRadius.circular(100),
              unselectedTextStyle: TextStyle(
                color: themes.isDark ? Colors.white : Colors.black,
              ),
              selectedColor: theme.colorScheme.secondary,
              spacing: 10,
              unselectedColor:
                  themes.isDark ? Colors.grey.shade700 : Colors.grey.shade300,
            ),
            onSelected: (string, index, isSelected) {
              if (index == 0) {
                _customAnimController.setDuration(900);
              } else if (index == 1) {
                _customAnimController.setDuration(650);
              } else if (index == 2) {
                _customAnimController.setDuration(500);
              } else if (index == 3) {
                _customAnimController.setDuration(400);
              } else if (index == 4) {
                _customAnimController.setDuration(250);
              }
            },
            buttons: [
              "Slowest",
              "Slow",
              "Normal",
              "Fast",
              "Fastest",
            ],
          ), */
          addVerticalMargin(22),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.animation),
              addHorizontalMargin(5),
              Text(
                "Custom",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          FlipInY(
            child: SfSlider(
              min: 0.0,
              max: widget.animModel.maxDuration,
              stepSize: 10,
              showTicks: true,
              value: _customAnimController.getDuration,
              showLabels: true,
              shouldAlwaysShowTooltip: false,
              enableTooltip: true,
              onChanged: (dynamic value) {
                setState(() {
                  _customAnimController.setDuration(value.toInt());
                });
              },
            ),
          ),
        ],
      );
    });
  }

  void saveAllValues() {
    for (var element in anim_models) {
      CustomAnimationController _customAnimController =
          Get.find(tag: element.keys[0]);
      _customAnimController.saveValues();
    }
  }
}
