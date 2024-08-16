import 'package:grassh_renew/src/config/config.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GlobalConfig {
  static late PackageInfo packageInfo;
  static late Config config;

  static init() async {
    packageInfo = await PackageInfo.fromPlatform();
    // config = Config(
    //   path: "./config.toml",
    //   defaultConfig: {
    //     "version": 1,
    //     "global": {
    //       "language": "zh-CN",
    //     },
    //   },
    // );
  }
}
