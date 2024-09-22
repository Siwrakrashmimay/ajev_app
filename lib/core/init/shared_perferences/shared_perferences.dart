import 'package:shared_preferences/shared_preferences.dart';

class Singleton {
  static final Singleton shared = Singleton._internal();

  factory Singleton() {
    return shared;
  }

  Singleton._internal();

  Future setTokenApi(String tokenApi) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('TokenApi', tokenApi);
  }

  Future<String?> getTokenApi() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('TokenApi') ?? '';
  }

  Future setFcmToken(String fcmToken) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('fcmToken', fcmToken);
  }

  Future<String?> getFcmToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('fcmToken');
  }

  Future setUserId(int userId) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('id', userId);
  }

  Future<int?> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('id');
  }

  Future setRole(String role) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('role', role);
  }

  Future<String?> getRole() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('role') ?? '';
  }

  Future setName(String name) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('name', name);
  }

  Future<String?> getName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('name') ?? '';
  }

  Future setExpiresAt(String expiresAt) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('expiresAt', expiresAt);
  }

  Future<String?> getExpiresAt() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('expiresAt') ?? '';
  }

  Future setPasswordChangedAt(String passwordChangedAt) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('passwordChangedAt', passwordChangedAt);
  }

  Future<String?> getPasswordChangedAt() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('passwordChangedAt') ?? '';
  }

  Future clearAll() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
