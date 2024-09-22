// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class GlobalProvider extends ChangeNotifier {
  String appVersion = '0.0.0';

  String appBuildNumber = '0';

  int _countNotification = 0;
  int get countNotification => _countNotification;
  set countNotification(int value) {
    _countNotification = value;
    notifyListeners();
  }

  String? _notificationRoute;
  String? get notificationRoute => _notificationRoute;
  set notificationRoute(String? value) => _notificationRoute = value;

  PermissionStatus? _permissionNotificationStatus;
  PermissionStatus? get permissionNotificationStatus =>
      _permissionNotificationStatus;
  set permissionNotificationStatus(PermissionStatus? value) {
    _permissionNotificationStatus = value;
    notifyListeners();
  }

  bool _showAlertPermissionNotification = false;
  bool get showAlertPermissionNotification => _showAlertPermissionNotification;
  set showAlertPermissionNotification(bool value) {
    _showAlertPermissionNotification = value;
    notifyListeners();
  }
}
