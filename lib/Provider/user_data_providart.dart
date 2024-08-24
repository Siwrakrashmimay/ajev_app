import 'package:flutter/material.dart';

import '../main/loginemail/model/user_model.dart';

class UserDataProvider extends ChangeNotifier {
  UserData? _userdata;
  UserData? get userdata => _userdata;
  set userdata(UserData? value) {
    _userdata = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
