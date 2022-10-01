import 'dart:developer';

import 'package:expensive_chat/shared/ui/app_theme/theme/subthemes/texts/res/data.dart';
import 'package:expensive_chat/shared/ui/app_theme/theme/subthemes/texts/utils/utils.dart';
import 'package:expensive_chat/shared/ui/app_theme/theme/utils/theme_utils.dart';
import 'package:expensive_chat/shared/ui/native/row/rowlr.dart';
import 'package:expensive_chat/shared/ui/native/size/margins.dart';
import 'package:expensive_chat/shared/ui/native/surface/bottomsheets/raw_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextStyleChanger extends StatefulWidget {
  const AppTextStyleChanger({super.key});

  @override
  State<AppTextStyleChanger> createState() => _AppTextStyleChangerState();
}

class _AppTextStyleChangerState extends State<AppTextStyleChanger> {
  Rx<String> style = textStyleUtils_textStyleName().obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Style"),
        addVerticalMargin(10),
        Obx(() {
          return RowLR(
              padding: 5,
              l: Text(style.value),
              r: TextButton(
                  onPressed: () async {
                    sheetwReturnR(
                            title: "Text Style",
                            heightp: 0.8,
                            aboveContent: Obx(() {
                              return Text(
                                "This is how ${style.value} looks!",
                                style: textStyleUtils_textStyle(style.value),
                              );
                            }),
                            content: Obx(() {
                              return CupertinoScrollbar(
                                child: Wrap(
                                  spacing: 5,
                                  children: appTextStyles
                                      .map((e) => ChoiceChip(
                                          label: Text(
                                            e.name,
                                            style: e.textStyle
                                                .copyWith(fontSize: 14),
                                          ),
                                          onSelected: (b) {
                                            if (!b) return;
                                            log("Selected ${e.name}");
                                            style.value = e.name;
                                          },
                                          selected: e.name == style.value))
                                      .toList(),
                                ),
                              );
                            }),
                            rxValue: style)
                        .then((value) {
                      if (value == null) return;
                      style.value = value;
                      textStyleUtils_setTextStyle(style.value);
                      themes.textStyle = textStyleUtils_textStyle(style.value);
                    });
                  },
                  child: Text("Change")));
        }),
      ],
    );
  }
}
