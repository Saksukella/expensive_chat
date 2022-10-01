import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static late PackageInfo _packageInfo;

  static Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  static String get author => "Egemen Erdem";

  static String get authorEmail => "egemenerdem78@gmail.com";

  static String get appName => _packageInfo.appName;

  static String get packageName => _packageInfo.packageName;

  static String get version => _packageInfo.version;

  static String get buildNumber => _packageInfo.buildNumber;
}
