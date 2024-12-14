import 'package:ajev_application/app/accuont/ark/view/ark_screen.dart';
import 'package:ajev_application/app/authentication/login_dealer/view/login_screen.dart';
import 'package:ajev_application/app/bike/bike_detail/view/bike_detail_screen.dart';
import 'package:ajev_application/app/bike/view/bike_screen.dart';
import 'package:ajev_application/app/main/distance/view/addnewuser_screen.dart';
import 'package:ajev_application/app/main/generalrepairs/view/addnewuser_screen.dart';
import 'package:ajev_application/app/main/view/main_screen.dart';
import 'package:ajev_application/app/main_dealer/view/main_user_screen.dart';
import 'package:ajev_application/app/main_user/view/main_user_screen.dart';
import 'package:ajev_application/app/service/service_part/service_battary/view/service_battary_screen.dart';
import 'package:ajev_application/app/service/service_part/view/service_part_screen.dart';
import 'package:ajev_application/app/service/view/service_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/authentication/login/view/login_screen.dart';
import '../../../app/authentication/resgister/view/resgister_screen.dart';
import '../../../app/main/addnewuser/view/addnewuser_screen.dart';
import '../../../app/main/claim/view/claim_screen.dart';
import '../../../app/main/distance/distance-view/distance-view-detail/view/distance_view_detail_screen.dart';
import '../../../app/main/distance/distance-view/view/distance_view_screen.dart';
import '../../../app/manual/view/manual_screen.dart';
import '../../../app/service/service_part/service_bike/service_bike_part/view/service_bike_part_screen.dart';
import '../../../app/service/service_part/service_bike/view/service_bike_screen.dart';
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
      case AppNavConstants.LOGIN_DEALER:
        return normalNavigate(
          const LoginDealerScreen(),
          AppNavConstants.LOGIN_DEALER,
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
      case AppNavConstants.SERVICE_BATTERY:
        return normalNavigate(
          const ServiceBattaryScreen(),
          AppNavConstants.SERVICE_BATTERY,
          settings.arguments,
        );
      case AppNavConstants.SERVICE_BIKE:
        return normalNavigate(
          const ServiceBikeScreen(),
          AppNavConstants.SERVICE_BIKE,
          settings.arguments,
        );
      case AppNavConstants.ARK:
        return normalNavigate(
          const ArkScreen(),
          AppNavConstants.ARK,
          settings.arguments,
        );

      case AppNavConstants.MAIN_USER_PANG:
        return normalNavigate(
          const MainUserScreen(),
          AppNavConstants.MAIN_USER_PANG,
          settings.arguments,
        );

      case AppNavConstants.MAIN_DEALER_PANG:
        return normalNavigate(
          const MainDealerScreen(),
          AppNavConstants.MAIN_DEALER_PANG,
          settings.arguments,
        );

      case AppNavConstants.MANUAL_SCREEN:
        return normalNavigate(
          const ManualScreen(),
          AppNavConstants.MANUAL_SCREEN,
          settings.arguments,
        );
      case AppNavConstants.CLAIM_SCREEN:
        return normalNavigate(
          const ClaimScreen(),
          AppNavConstants.MANUAL_SCREEN,
          settings.arguments,
        );
      case AppNavConstants.DISTANCE:
        return normalNavigate(
          const DistanceScreen(),
          AppNavConstants.DISTANCE,
          settings.arguments,
        );
      case AppNavConstants.GENERALREPIRS:
        return normalNavigate(
          const GeneralrepirsScreen(),
          AppNavConstants.GENERALREPIRS,
          settings.arguments,
        );

      case AppNavConstants.DISTANCEVIEW:
        return normalNavigate(
          const DistanceScreenView(),
          AppNavConstants.DISTANCEVIEW,
          settings.arguments,
        );

      case AppNavConstants.SERVICE_BIKE_PART_VIEW:
        return normalNavigate(
          const ServiceBikePartScreen(),
          AppNavConstants.SERVICE_BIKE_PART_VIEW,
          settings.arguments,
        );

      case AppNavConstants.DISTANCE_VIEW_DETAIL:
        return normalNavigate(
          const DistanceViewDetailScreen(),
          AppNavConstants.DISTANCE_VIEW_DETAIL,
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
