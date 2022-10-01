import 'package:get/get.dart';

import '../../../ui/pages/home/home.dart';
import '../../../ui/pages/settings.dart';
import '../../ui/app_theme/customization/customization.dart';
import '../firebase/auth/login/login.dart';

class AppRoutes {
  static String HOME = '/';
  static String LOGIN = '/login';
  static String SETTINGS = '/settings';
  static String CUSTOMIZATIONS = '/customization';

  static List<GetPage> pages = [
    GetPage(name: HOME, page: () => const Home()),
    GetPage(name: LOGIN, page: () => const Login()),
    GetPage(name: SETTINGS, page: () => const Settings()),
    GetPage(name: CUSTOMIZATIONS, page: () => const Customizations()),
  ];
}
