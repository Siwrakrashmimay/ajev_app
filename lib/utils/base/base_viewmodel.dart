import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _loadingMain = false;
  bool get loadingMain => _loadingMain;
  set loadingMain(bool value) {
    _loadingMain = value;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _loadingPage = false;
  bool get loadingPage => _loadingPage;
  set loadingPage(bool value) {
    _loadingPage = value;
    notifyListeners();
  }

  String? _msgError;
  String? get msgError => _msgError;
  set msgError(String? value) {
    _msgError = value;
    notifyListeners();
  }

  void unfocus(BuildContext context) => FocusScope.of(context).unfocus();

  Future getArguments(BuildContext context) async =>
      ModalRoute.of(context)?.settings.arguments;
}
