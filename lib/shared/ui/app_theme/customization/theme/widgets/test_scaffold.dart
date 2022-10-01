import 'package:animate_do/animate_do.dart';
import 'package:expensive_chat/shared/ui/app_theme/theme/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../native/size/margins.dart';
import '../../../theme/utils/theme_utils.dart';
import '../controllers/theme_controller.dart';

class TestScaffold extends StatefulWidget {
  TestScaffold({super.key, this.widht = 215});

  final double widht;
  @override
  State<TestScaffold> createState() => _TestScaffoldState();
}

class _TestScaffoldState extends State<TestScaffold> {
  List<SalomonBottomBarItem> salItems = [
    SalomonBottomBarItem(
        icon: const Icon(Icons.home), title: const Text("Home")),
    SalomonBottomBarItem(
        icon: const Icon(Icons.checklist), title: const Text("Tasks")),
    SalomonBottomBarItem(
        icon: const Icon(FontAwesomeIcons.diagramProject),
        title: const Text("Projects")),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    CustomThemeController _customThemeController = Get.find();

    return Obx(() {
      return SlideInLeft(
        child: Theme(
          data: _customThemeController.getThemeData,
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  width: widget.widht,
                  height: widget.widht * 2,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 12, right: 5),
                            color: themes.isDark
                                ? _customThemeController
                                    .getThemeData.appBarTheme.surfaceTintColor
                                : _customThemeController
                                    .getThemeData.primaryColor,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Test Title",
                                  style: bodyMedium()
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                          top: 40,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            color: _customThemeController.getBackgroundColor(),
                            child: ListView(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              children: [
                                addVerticalMargin(5),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 90,
                                    height: 30,
                                    child: FittedBox(
                                      child: Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Text("Cool",
                                                style: bodySmall().copyWith(
                                                    color:
                                                        _customThemeController
                                                            .getTextColor())),
                                          ),
                                          addHorizontalMargin(2),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text("Cooler",
                                                style: bodySmall().copyWith(
                                                    color:
                                                        _customThemeController
                                                            .getTextColor())),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                addVerticalMargin(5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Settings",
                                      style: bodyMedium().copyWith(
                                          color: _customThemeController
                                              .getTextColor()),
                                    ),
                                    Container(
                                      width: 70,
                                      child: FittedBox(
                                        child: Row(
                                          children: [
                                            addHorizontalMargin(10),
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: _customThemeController
                                                      .getIconColor(),
                                                )),
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: _customThemeController
                                                      .getIconColor(),
                                                )),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Card(
                                    color:
                                        _customThemeController.getCardColor(),
                                    child: Column(
                                      children: [
                                        _TestSwitchTile(),
                                        _TestSwitchTile(),
                                      ],
                                    )),
                                addVerticalMargin(5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tasks",
                                      style: bodyMedium().copyWith(
                                          color: _customThemeController
                                              .getTextColor()),
                                    ),
                                    Container(
                                      width: 70,
                                      child: FittedBox(
                                        child: Row(
                                          children: [
                                            addHorizontalMargin(10),
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: _customThemeController
                                                      .getIconColor(),
                                                )),
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: _customThemeController
                                                      .getIconColor(),
                                                )),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Card(
                                    color:
                                        _customThemeController.getCardColor(),
                                    child: Column(
                                      children: [
                                        _TestCheckboxTile(),
                                        _TestCheckboxTile(),
                                      ],
                                    )),
                              ],
                            ),
                          )),
                      Positioned(
                          bottom: 52,
                          right: 15,
                          child: Container(
                            width: 33.0,
                            height: 33.0,
                            child: new RawMaterialButton(
                              shape: new CircleBorder(),
                              elevation: 0.0,
                              fillColor: _customThemeController
                                  .getThemeData.colorScheme.secondary,
                              child: Icon(
                                Icons.add,
                                color:
                                    themes.isDark ? Colors.black : Colors.white,
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                          )),
                      Positioned(
                        bottom: 0,
                        left: 5,
                        right: 5,
                        height: 45,
                        child: SalomonBottomBar(
                          itemPadding:
                              EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                          items: [
                            SalomonBottomBarItem(
                              icon: Icon(
                                Icons.home,
                                size: 18,
                              ),
                              title: Text(
                                "Test1",
                                style: bodySmall().copyWith(
                                    color: _customThemeController
                                        .getThemeData.primaryColor),
                              ),
                            ),
                            SalomonBottomBarItem(
                                icon: Icon(
                                  Icons.checklist,
                                  size: 18,
                                ),
                                title: Text(
                                  "Test2",
                                  style: bodySmall().copyWith(
                                      color: _customThemeController
                                          .getThemeData.primaryColor),
                                )),
                            SalomonBottomBarItem(
                                icon: Icon(
                                  FontAwesomeIcons.diagramProject,
                                  size: 16,
                                ),
                                title: Text(
                                  "Test3",
                                  style: bodySmall().copyWith(
                                      color: _customThemeController
                                          .getThemeData.primaryColor),
                                )),
                          ],
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          currentIndex: selectedIndex,
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      );
    });
  }
}

class _TestCheckboxTile extends StatefulWidget {
  const _TestCheckboxTile();

  @override
  State<_TestCheckboxTile> createState() => __TestCheckboxTileState();
}

class __TestCheckboxTileState extends State<_TestCheckboxTile> {
  var _isChecked = true.obs;
  @override
  Widget build(BuildContext context) {
    CustomThemeController _customThemeController = Get.find();
    return ListTile(
      tileColor: _customThemeController.getListTileColor(),
      dense: true,
      visualDensity: VisualDensity(horizontal: -3, vertical: -3),
      title: Obx(() {
        return Text(
          "Test Checkbox",
          style: labelSmall().copyWith(
            color: _customThemeController.getTextColor(),
          ),
        );
      }),
      leading: Icon(
        Icons.bookmark,
        size: 15,
        color: _customThemeController.getListTileIconColor(),
      ),
      minLeadingWidth: 0,
      trailing: Transform.scale(
        scale: 0.7,
        child: Checkbox(
          value: _isChecked.value,
          onChanged: (value) {
            setState(() {
              _isChecked.value = value!;
            });
          },
        ),
      ),
    );
  }
}

class _TestSwitchTile extends StatefulWidget {
  const _TestSwitchTile();

  @override
  State<_TestSwitchTile> createState() => __TestSwitchTileState();
}

class __TestSwitchTileState extends State<_TestSwitchTile> {
  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    CustomThemeController _customThemeController = Get.find();
    return ListTile(
      dense: true,
      tileColor: _customThemeController.getListTileColor(),
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      visualDensity: VisualDensity(horizontal: -3, vertical: -3),
      title: Text(
        "Switch Test",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: labelSmall().copyWith(
          color: _customThemeController.getTextColor(),
        ),
      ),
      leading: Icon(
        Icons.info_outline,
        size: 15,
        color: _customThemeController.getListTileIconColor(),
      ),
      minLeadingWidth: 0,
      trailing: Transform.scale(
        scale: 0.7,
        child: Switch(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value;
            });
          },
        ),
      ),
    );
  }
}
