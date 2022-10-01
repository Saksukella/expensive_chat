import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:expensive_chat/shared/ui/app_theme/customization/animation/res/panel_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/preferences/utils/pref_operations.dart';
import '../../../native/card/titled_card.dart';
import '../../../native/row/iconed_text.dart';
import '../../../native/size/margins.dart';
import '../../theme/utils/text_utils.dart';
import '../../theme/utils/theme_utils.dart';
import '../theme/widgets/textbuttons.dart';
import '../user_widgets/user_expansion_panel_radio.dart';
import '../widgets/setting_disabled.dart';
import 'Utils/key_utils.dart';
import 'controllers/animation_controller.dart';
import 'dialogs/edit_animation.dart';
import 'res/animation_keys.dart';
import 'res/data.dart';

class CustomAnimations extends StatefulWidget {
  const CustomAnimations({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<CustomAnimations> createState() => _CustomAnimationsState();
}

class _CustomAnimationsState extends State<CustomAnimations> {
  @override
  Widget build(BuildContext context) {
    bool isAnimEnabled = readPrefBool(AnimationKeys.animation_enabled) ?? true;

    for (var i = 0; i < anim_models.length; i++) {
      CustomAnimationController _animController = Get.put(
          CustomAnimationController(keys: anim_models[i].keys),
          tag: anim_models[i].keys[0]);
    }
    final colorizeColors = [
      theme.primaryColor,
      theme.colorScheme.secondary,
      theme.colorScheme.tertiary,
    ];

    return Obx(() {
      return ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          addVerticalMargin(10),
          TitledCard(
              title: IconedText(
                  title: "Animations",
                  style: bodyLarge(),
                  bold: true,
                  icons: Icons.animation_outlined),
              cardContent: Column(
                children: [
                  addVerticalMargin(5),
                  SwitchListTile(
                      value: isAnimEnabled,
                      title: Text(
                        "Enable Animations",
                      ),
                      onChanged: (value) {
                        isAnimEnabled = !isAnimEnabled;
                        writePrefBool(AnimationKeys.animation_enabled, value);
                        setState(() {});
                        Get.back();
                      }),
                  Divider(),
                  isAnimEnabled
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addVerticalMargin(10),
                            Text(
                              "Settings",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            addVerticalMargin(10),
                            UserExpansionPanelRadio(
                                scrollOffset: 300,
                                listViewController: widget.scrollController,
                                panelList: [
                                  userExpansionPanelItem(
                                      value: 0,
                                      headerBuilder: (context, isExpanded) {
                                        return ListTile(
                                          title: Text("Animation Settings"),
                                          leading:
                                              Icon(Icons.settings_outlined),
                                          minLeadingWidth: 0,
                                        );
                                      },
                                      body: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10,
                                            left: 10,
                                            right: 10,
                                            top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ResetRandomSaveButtons(
                                              resetAll: () {
                                                for (var element
                                                    in getAnimationUtils_ControllerKeys()) {
                                                  Get.find<CustomAnimationController>(
                                                          tag: element)
                                                      .reset();
                                                }
                                              },
                                              editAll: () {
                                                showDialog_Edit_Animation_All(
                                                    getAnimationUtils_ControllerKeys());
                                              },
                                            ),
                                            UserExpansionPanelRadio(
                                                scrollOffset: 350,
                                                listViewController:
                                                    widget.scrollController,
                                                panelList: animQuickSPanels),
                                          ],
                                        ),
                                      ))
                                ]),
                          ],
                        )
                      : SettingDisabled(
                          isEnable: isAnimEnabled,
                          title: "Animations are disabled"),
                  isAnimEnabled
                      ? Column(
                          children: [
                            addVerticalMargin(20),
                            Row(
                              children: [
                                AnimatedTextKit(
                                  animatedTexts: [
                                    ColorizeAnimatedText(
                                      'Live Animations',
                                      textStyle: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      colors: colorizeColors,
                                      speed: Duration(milliseconds: 700),
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                  repeatForever: true,
                                  onTap: () {
                                    print("Tap Event");
                                  },
                                ),
                              ],
                            ),
                            addVerticalMargin(10),
                            UserExpansionPanelRadio(
                                scrollOffset: 550,
                                listViewController: widget.scrollController,
                                panelList: animPanels)
                          ],
                        )
                      : Container(),
                  addVerticalMargin(5)
                ],
              )),
          addVerticalMargin(10),
        ],
      );
    });
  }
}
