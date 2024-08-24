import 'package:ajev_application/main/loginemail/view/loginemail.dart';
import 'package:flutter/cupertino.dart';

import '../../main/homeviewbottomBar/view/homebottomBarView.dart';
import '../../main/login/view/loginview.dart';
import '../../main/register/view/register_user.dart';
import '../../main/userdealer/view/userdealer.dart';
import 'navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic>? generateRoute(RouteSettings settings) {
    if (settings.name == null) return null;
    final uri = Uri.parse(settings.name!);

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

    switch (uri.path) {
      case AppNavConstants.LOGIN:
        return normalNavigate(
          const LoginPage(),
          AppNavConstants.LOGIN,
          settings.arguments,
        );

      case AppNavConstants.USER_TYPE_SELECTION:
        return normalNavigate(
          const UserTypeSelectionPage(),
          AppNavConstants.USER_TYPE_SELECTION,
          settings.arguments,
        );

      case AppNavConstants.Login_Register_Page:
        return normalNavigate(
          const LoginRegisterPage(),
          AppNavConstants.Login_Register_Page,
          settings.arguments,
        );

      case AppNavConstants.Home_Bottom_Bar_View:
        return normalNavigate(
          const HomeBottomBarView(),
          AppNavConstants.Home_Bottom_Bar_View,
          settings.arguments,
        );

      case AppNavConstants.Register:
        return normalNavigate(
          RegisterUserScreen(),
          AppNavConstants.Register,
          settings.arguments,
        );
      // Add other routes here
    }
    return null; // Return null if no matching route is found
  }
}
