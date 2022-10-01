import 'dart:developer';

import 'package:expensive_chat/shared/ui/app_theme/app_animations/models/app_anim_models.dart';
import 'package:expensive_chat/shared/ui/app_theme/app_animations/utils/anim_utils.dart';
import 'package:expensive_chat/shared/ui/app_theme/customization/animation/res/animation_keys.dart';
import 'package:expensive_chat/shared/ui/app_theme/theme/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserExpansionPanelRadio extends StatelessWidget {
  const UserExpansionPanelRadio(
      {super.key,
      required this.panelList,
      this.callback,
      this.listViewController,
      this.scrollOffset = 200});
  final List<ExpansionPanelRadio> panelList;
  final Function(int panelIndex, bool isExpanded)? callback;
  final ScrollController? listViewController;
  final double scrollOffset;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      AppAnimModels animModels =
          anims.withKey(AnimationKeys.EXPANSION_ANIM_DURATION);
      log('UserExpansionPanelRadio:');
      return ExpansionPanelList.radio(
        elevation: 0,
        animationDuration: Duration(milliseconds: animModels.animDuration),
        expandedHeaderPadding: EdgeInsets.zero,
        children: panelList,
        expansionCallback: (index, isExpanded) async {
          callback?.call(index, isExpanded);
          if (listViewController != null) {
            if (!isExpanded) {
              await Future.delayed(Duration(milliseconds: 120));
              listViewController!.animateTo(
                listViewController!.initialScrollOffset + scrollOffset,
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          }
        },
      );
    });
  }
}

ExpansionPanelRadio userExpansionPanelItem({
  required value,
  required Widget Function(BuildContext context, bool isExpaned) headerBuilder,
  required body,
  Color? color,
}) {
  return ExpansionPanelRadio(
    value: value,
    backgroundColor: color,
    headerBuilder: headerBuilder,
    body: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          border: Border.all(
            color: Colors.grey.withOpacity(themes.isDark ? 0.25 : 0.35),
            width: 0.7,
          )),
      padding: EdgeInsets.all(3),
      child: body,
    ),
    canTapOnHeader: true,
  );
}
