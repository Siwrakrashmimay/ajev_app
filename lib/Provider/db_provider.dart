import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main/loginemail/model/user_model.dart';
import '../utils/navigation/navigation_constants.dart';
import '../utils/navigation/route_manager.dart';

class DatabaseProvider extends ChangeNotifier {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String _token = '';
  String _userId = '';

  UserData? _userdata;
  UserData? get userdata => _userdata;
  set userdata(UserData? value) {
    _userdata = value;
    notifyListeners();
  }

  String get token => _token;
  String get userId => _userId;

  void saveToken(String token) async {
    SharedPreferences value = await _pref;
    value.setString('token', token);
  }

  void saveUserId(int userId) async {
    SharedPreferences value = await _pref;
    value.setString('id', userId.toString());
  }

  Future<String> getToken() async {
    SharedPreferences value = await _pref;
    if (value.containsKey('token')) {
      String data = value.getString('token')!;
      _token = data;
      notifyListeners();
      return data;
    } else {
      _token = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getUserId() async {
    SharedPreferences value = await _pref;
    if (value.containsKey('id')) {
      String data = value.getString('id')!;
      _userId = data;
      notifyListeners();
      return data;
    } else {
      _userId = '';
      notifyListeners();
      return '';
    }
  }

  void logOut(BuildContext context) async {
    final value = await _pref;

    value.clear();

    if (context.mounted) {
      AppNav.toReplacementName(context, AppNavConstants.LOGIN);
    }
  }
}
