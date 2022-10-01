import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_theme/theme/utils/theme_utils.dart';

Flushbar? flushbar;

Flushbar _flushbar(String title, String message,
    {IconData? iconData, Function? action, String actionText = 'Undo'}) {
  flushbar != null ? flushbar!.dismiss() : flushbar = null;

  bool isClicked = false;
  return Flushbar(
    titleText: Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    messageText: Text(message),
    animationDuration: Duration(milliseconds: 800),
    mainButton: action != null
        ? TextButton(
            onPressed: () {
              if (!isClicked) {
                isClicked = true;
                action();
                flushbar!.dismiss();
              }
            },
            child: Text(
              actionText,
              style: TextStyle(color: theme.primaryColor),
            ))
        : null,
    backgroundColor: themes.isDark
        ? Colors.grey.shade800.withOpacity(0.6)
        : Colors.grey.shade200.withOpacity(0.6),
    icon: Icon(
      iconData ?? Icons.info,
    ),
    margin: EdgeInsets.fromLTRB(8, 8, 8, 10),
    duration: Duration(seconds: 4),
    borderRadius: BorderRadius.circular(10),
    barBlur: 10,
    flushbarStyle: FlushbarStyle.FLOATING,
  );
}

showSnackbar(String title, String message, {IconData? iconData}) {
  ScaffoldMessenger.of(Get.context!).clearSnackBars();

  flushbar = _flushbar(title, message, iconData: iconData)..show(Get.context!);
}

showSnackbarWithAction(
    String title, String message, String actionLabel, Function() action,
    {IconData? iconData, int duration = 4}) {
  flushbar = _flushbar(title, message,
      iconData: iconData, actionText: actionLabel, action: action)
    ..show(Get.context!);
}
