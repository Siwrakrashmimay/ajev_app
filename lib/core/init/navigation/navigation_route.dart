import 'package:ajev_application/app/bike/bike_detail/view/bike_detail_screen.dart';
import 'package:ajev_application/app/bike/view/bike_screen.dart';
import 'package:ajev_application/app/main/view/main_screen.dart';
import 'package:ajev_application/app/service/service_part/view/service_part_screen.dart';
import 'package:ajev_application/app/service/view/service_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/authentication/login/view/login_screen.dart';
import '../../../app/authentication/resgister/view/resgister_screen.dart';
import '../../../app/main/addnewuser/view/addnewuser_screen.dart';
import '../../../app/splash/view/splash_screen.dart';
import '../../widgets/not_found_navigation.dart';
import 'navigation_constans.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic>? generateRoute(RouteSettings settings) {
    if (settings.name == null) return null;
    final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case AppNavConstants.DEFALT:
        return normalNavigate(
          const SplashScreen(),
          AppNavConstants.DEFALT,
          settings.arguments,
        );
      case AppNavConstants.LOGIN:
        return normalNavigate(
          const LoginScreen(),
          AppNavConstants.LOGIN,
          settings.arguments,
        );

      case AppNavConstants.REGISTER:
        return normalNavigate(
          const ResgisterScreen(),
          AppNavConstants.REGISTER,
          settings.arguments,
        );

      case AppNavConstants.MAIN_PANG:
        return normalNavigate(
          const MainScreen(),
          AppNavConstants.MAIN_PANG,
          settings.arguments,
        );

      case AppNavConstants.ADD_NEW_USER:
        return normalNavigate(
          const AddnewuserScreen(),
          AppNavConstants.ADD_NEW_USER,
          settings.arguments,
        );

      case AppNavConstants.SERVICE:
        return normalNavigate(
          const ServiceScreen(),
          AppNavConstants.SERVICE,
          settings.arguments,
        );
      case AppNavConstants.SERVICE_PART:
        return normalNavigate(
          const ServicePartScreen(),
          AppNavConstants.SERVICE_PART,
          settings.arguments,
        );

      case AppNavConstants.BIKE:
        return normalNavigate(
          const BikeScreen(),
          AppNavConstants.BIKE,
          settings.arguments,
        );

      case AppNavConstants.BIKE_DETAIL:
        return normalNavigate(
          const BikeDetailScreen(),
          AppNavConstants.BIKE_DETAIL,
          settings.arguments,
        );

      default:
        return CupertinoPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  CupertinoPageRoute normalNavigate(
    Widget widget,
    String pageName,
    Object? arguments,
  ) {
    return CupertinoPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(
        name: pageName,
        arguments: arguments,
      ),
    );
  }
}
