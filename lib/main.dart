import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'core/app_lifecycle_tracker/app_lifecycle_tracker.dart';
import 'core/init/constants/app/app_constant.dart';
import 'core/init/langs/language_manger.dart';
import 'core/init/navigation/navigation_route.dart';
import 'provider/provider_list.dart';

void main() async {
  await _init();
  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: AppConstants.LANG_ASSET_PATH,
        fallbackLocale: LanguageManager.instance.thLocale,
        startLocale: LanguageManager.instance.thLocale,
        child: const AppLifecycleTracker(
          child: MyApp(),
        ),
      ),
    ),
  );
}

Future<void> _init() async {
  Intl.defaultLocale = 'th';
  WidgetsFlutterBinding.ensureInitialized();
  await AppFirebase.ensureInitialized();
  await AppLocalNotificationPlugin.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  EasyLocalization.logger.enableBuildModes = [];
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      // home: const AttendanceRecordFormScreen(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
    );
  }
}
