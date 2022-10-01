import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/services/firebase/auth/utils/auth_utils.dart';
import '../../shared/services/firebase/widgets/user_circleavatar.dart';
import '../../shared/services/info/package_info.dart';
import '../../shared/services/routes/app_routes.dart';
import '../../shared/ui/app_theme/theme/utils/text_utils.dart';
import '../../shared/ui/native/card/titled_card.dart';
import '../../shared/ui/native/row/iconed_text.dart';
import '../../shared/ui/native/row/widgetw_text.dart';
import '../../shared/ui/native/size/margins.dart';
import '../../shared/ui/native/surface/dialog/raw_dialog.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    log("Settings build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Obx(() {
        return ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: [
            addVerticalMargin(10),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TitledCard(
                    title: IconedText(
                      title: "Account",
                      icons: Icons.account_box,
                      style: titleLarge(),
                      bold: true,
                    ),
                    horizontalMargin: 20,
                    cardContent: Column(
                      children: [
                        addVerticalMargin(15),
                        WidgetwText(
                          title: auth.safeName,
                          widget: GestureDetector(
                            onTap: () async {
                              var userName = auth.safeName.obs;
                              dialogwReturnR(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: TextEditingController(
                                          text: userName.value),
                                      onChanged: (value) =>
                                          userName.value = value,
                                    ),
                                  ],
                                ),
                                rxValue: userName,
                                title: "Change name",
                              ).then((value) async {
                                if (value == null) return;
                                await auth.changeUsername(value!);
                              });
                            },
                            child: Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                        ),
                        addVerticalMargin(20),
                        IconedText(
                          title: auth.safeEmail,
                          icons: Icons.email,
                        ),
                        addVerticalMargin(15),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: () async {
                                dialogwButtons(
                                  content: Text("Are you sure?"),
                                  title: "Sign out",
                                ).then((value) {
                                  if (value ?? false) {
                                    auth.signOut();

                                    Get.offAllNamed(AppRoutes.LOGIN);
                                  }
                                });
                              },
                              child: Text("Sign out")),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: UserCircleAvatar(
                    radius: 50,
                  ),
                )
              ],
            ),
            Divider(),
            addVerticalMargin(5),
            TitledCard(
              verticalMargin: 5,
              title: IconedText(
                title: "Settings",
                icons: Icons.settings,
                style: bodyLarge(),
                bold: true,
              ),
              cardContent: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Customizations',
                    ),
                    minLeadingWidth: 5,
                    leading: Icon(Icons.dashboard_customize_rounded),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                    onTap: () {
                      Get.toNamed(AppRoutes.CUSTOMIZATIONS);
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            addVerticalMargin(5),
            TitledCard(
              verticalMargin: 5,
              title: IconedText(
                title: "Other",
                icons: Icons.abc,
                style: bodyLarge(),
                bold: true,
              ),
              cardContent: Column(
                children: [
                  ListTile(
                    title: Text(
                      'About',
                    ),
                    minLeadingWidth: 5,
                    leading: Icon(Icons.info),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: AppInfo.appName,
                        applicationVersion: AppInfo.version,
                        children: [
                          Text(
                            "Made by  ❤️ ${AppInfo.author}",
                            style: bodyLarge(),
                          ),
                          addVerticalMargin(10),
                          Text("Contact: ${AppInfo.authorEmail}"),
                        ],
                        applicationIcon: Image.asset(
                          "assets/icons/launcher_icon.png",
                          width: 50,
                          height: 50,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
