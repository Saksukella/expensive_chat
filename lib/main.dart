import 'dart:developer';

import 'package:expensive_chat/shared/ui/app_theme/app_animations/app_anim_controller.dart';
import 'package:expensive_chat/shared/ui/app_theme/customization/animation/res/animation_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'shared/services/info/package_info.dart';
import 'shared/services/preferences/s_prefs.dart';
import 'shared/services/routes/app_routes.dart';
import 'shared/ui/app_theme/theme/themes.dart';
import 'shared/ui/app_theme/theme/utils/user_spesific.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppSharedPreferences.init();
  await AppInfo.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Themes themes = Get.put(Themes());
    Anims a = Get.put(Anims());
    return Obx(() {
      themes.setThemeData = userSpesificColors(themes.themeData);
      int transitionDuration =
          a.withKey(AnimationKeys.TRANSITION_ANIM_DURATION).animDuration;
      log("transitionDuration: $transitionDuration");
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themes.themeData,
        getPages: AppRoutes.pages,
        defaultTransition: Transition.cupertino,
        transitionDuration: Duration(milliseconds: transitionDuration),
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? AppRoutes.LOGIN
            : AppRoutes.HOME,
      );
    });
  }
}
