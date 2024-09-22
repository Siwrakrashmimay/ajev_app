import 'package:flutter/material.dart';

import '../../../../core/base/base_viewmodel.dart';
import '../../../../repo/login_singup_repo.dart';

class ResgisterViewModel extends BaseViewModel {
  ResgisterViewModel({required BuildContext context});

  final formResgisterKey = GlobalKey<FormState>();

  final _loginSingupRepo = LoginSingupRepo();

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String _sername = '';
  String get sername => _sername;
  set sername(String value) {
    _sername = value;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String _gender = '';
  String get gender => _gender;
  set genter(String value) {
    _gender = value;
    notifyListeners();
  }

  String _tel = '';
  String get tel => _tel;
  set tel(String value) {
    _tel = value;
    notifyListeners();
  }

  String _idcardnumber = '';
  String get idcardnumber => _idcardnumber;
  set idcardnumber(String value) {
    _idcardnumber = value;
    notifyListeners();
  }

  Future<void> prepareInfoResgister({
    required String name,
    required String surname,
    required String email,
    required String phoneNumber,
    required String idCardNumber,
  }) async {
    try {
      loading = true;
      await _loginSingupRepo.register(
        phoneNumber: phoneNumber,
        idCardNumber: idCardNumber,
        email: email,
        name: name,
        surname: surname,
      );
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }
}
