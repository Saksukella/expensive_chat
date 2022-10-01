import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../native/size/margins.dart';
import '../controllers/subtheme_controller.dart';
import '../controllers/theme_controller.dart';
import '../items/all_components.dart';
import '../widgets/color_picker.dart';
import '../widgets/test_scaffold.dart';
import '../widgets/textbuttons.dart';

class SubTheme extends StatelessWidget {
  SubTheme({super.key});

  @override
  Widget build(BuildContext context) {
    CustomThemeController _customThemeController = Get.find();
    SubthemeController _subthemeController = Get.put(SubthemeController());
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResetRandomSaveButtons(
              saveAll: () {
                _customThemeController.saveAll();
              },
              save: () {
                _customThemeController.saveAllSubThemes();
              },
              reset: () {
                _customThemeController.resetAllSubthemes();
              },
              resetAll: () {
                _customThemeController.resetAll();
              },
            ),
            addVerticalMargin(10),
            Row(
              children: [
                TestScaffold(
                  widht: 200,
                ),
                addHorizontalMargin(10),
                Expanded(
                  child: ComponentsList(),
                )
              ],
            ),
            addVerticalMargin(25),
            ThemeColorPicker(
              initialColor: _subthemeController.getColorWithIndex(),
              onChanged: (color) =>
                  _subthemeController.setColorWithIndex(color),
            )
          ],
        ),
      );
    });
  }
}
