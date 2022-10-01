import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/res/app_default.dart';
import '../../../shared/services/firebase/auth/auth_sevice.dart';
import '../../../shared/services/firebase/widgets/user_circleavatar.dart';
import '../../../shared/services/info/package_info.dart';
import '../../../shared/services/routes/app_routes.dart';
import '../../../shared/ui/app_theme/theme/utils/text_utils.dart';
import '../../../shared/ui/native/row/widgetw_text.dart';
import 'components/chat.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthService());
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: WidgetwText(
            title: AppInfo.appName,
            widget: Hero(
                tag: SResourses.APP_ICON_ASSETS,
                child: Image.asset(SResourses.APP_ICON_ASSETS)),
            style: bodyLarge().apply(color: Colors.white),
          ),
          actions: [
            FittedBox(
              child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.SETTINGS);
                  },
                  child: UserCircleAvatar()),
            )
          ],
        ),
        body: ChatWidget(),
      );
    });
  }
}
