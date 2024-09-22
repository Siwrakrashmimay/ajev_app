import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._init();
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  final thLocale = const Locale('th', 'TH');
  final enLocale = const Locale('en', 'US');

  List<Locale> get supportedLocales => [thLocale, enLocale];
}
