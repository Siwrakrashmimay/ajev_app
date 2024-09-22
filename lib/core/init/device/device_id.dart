// ignore_for_file: empty_catches

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

import '../constants/app/app_constant.dart';

Future<String?> getDeviceID() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? identifier;
  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo id = await deviceInfo.androidInfo;
      identifier = id.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo id = await deviceInfo.iosInfo;
      identifier = id.identifierForVendor;
    } else if (Platform.isMacOS) {
      MacOsDeviceInfo id = await deviceInfo.macOsInfo;
      identifier = id.systemGUID;
    } else {
      identifier = AppConstants.UNKNOW;
    }
  } catch (e) {}
  return identifier;
}
