import 'package:flutter/foundation.dart';
import '../constants/app/app_constant.dart';

class AppPlatform {
  AppPlatform._init();
  static final AppPlatform _instance = AppPlatform._init();
  static AppPlatform get instance => _instance;

  String get platform {
    String platform;

    if (kIsWeb) {
      platform = AppConstants.WEB;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          platform = AppConstants.IOS;
          break;
        case TargetPlatform.android:
          platform = AppConstants.ANDROID;
          break;
        case TargetPlatform.linux:
          platform = AppConstants.LINUX;
          break;
        case TargetPlatform.macOS:
          platform = AppConstants.MACOS;
          break;
        case TargetPlatform.windows:
          platform = AppConstants.WINDOWS;
          break;
        default:
          platform = AppConstants.UNKNOW;
          break;
      }
    }
    return platform;
  }
}
