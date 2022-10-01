import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../native/card/titled_card.dart';
import '../../../native/row/iconed_text.dart';
import '../../../native/size/margins.dart';
import '../../theme/utils/text_utils.dart';
import '../../theme/utils/theme_utils.dart';
import '../user_widgets/user_expansion_panel_radio.dart';
import 'components/main_colors.dart';
import 'components/subtheme.dart';
import 'components/text_theme/text_theme.dart';
import 'controllers/theme_controller.dart';

class CustomThemes extends StatelessWidget {
  CustomThemes({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    CustomThemeController themeController = Get.put(CustomThemeController());
    final GlobalKey _key = GlobalKey();
    return Obx(() {
      return Column(
        children: [
          addVerticalMargin(10),
          TitledCard(
              title: IconedText(
                title: "Themes",
                style: bodyLarge(),
                icons: Icons.colorize_sharp,
                bold: true,
              ),
              cardContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalMargin(5),
                  SwitchListTile(
                    title: Text("Dark Mode"),
                    value: theme.brightness == Brightness.dark,
                    onChanged: (value) {
                      themes.isDark = value;
                    },
                  ),
                  Divider(),
                  UserExpansionPanelRadio(
                    key: _key,
                    panelList: [
                      userExpansionPanelItem(
                        value: 0,
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            title: Text("Theme"),
                            minLeadingWidth: 0,
                            leading: Icon(Icons.format_color_fill_outlined),
                          );
                        },
                        body: ThemeMainColors(),
                      ),
                      userExpansionPanelItem(
                        value: 1,
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            title: Text("SubTheme"),
                            minLeadingWidth: 0,
                            leading: Icon(Icons.subdirectory_arrow_right),
                          );
                        },
                        body: SubTheme(),
                      ),
                      userExpansionPanelItem(
                        value: 2,
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            title: Text("Text"),
                            minLeadingWidth: 0,
                            leading: Icon(Icons.text_fields_sharp),
                          );
                        },
                        body: ThemeText(),
                      ),
                    ],
                    scrollOffset: 250,
                    listViewController: scrollController,
                  ),
                  addVerticalMargin(5),
                ],
              )),
          addVerticalMargin(10),
        ],
      );
    });
  }
}
