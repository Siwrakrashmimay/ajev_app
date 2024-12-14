// ignore_for_file: unused_field

import 'package:ajev_application/core/base/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_profile_provider.dart';

class MainUserView extends BaseViewModel {
  final UserProfileProvider? _userProfileProvider;
  MainUserView({required BuildContext context})
      : _userProfileProvider = context.read<UserProfileProvider>();

  bool _isFirstButtonSelected = false;
  bool _isSecondButtonSelected = false;

  bool get isFirstButtonSelected => _isFirstButtonSelected;
  bool get isSecondButtonSelected => _isSecondButtonSelected;

  void toggleFirstButton() {
    _isFirstButtonSelected = !_isFirstButtonSelected;
    notifyListeners(); // แจ้งให้ Widget ที่เชื่อมต่ออัปเดตสถานะ
  }

  void toggleSecondButton() {
    _isSecondButtonSelected = !_isSecondButtonSelected;
    notifyListeners(); // แจ้งให้ Widget ที่เชื่อมต่ออัปเดตสถานะ
  }
}
