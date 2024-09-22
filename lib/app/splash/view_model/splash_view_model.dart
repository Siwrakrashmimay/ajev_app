import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/base/base_viewmodel.dart';
import '../../../core/model/userprofile/user_profile_model.dart';
// import '../../../core/utility/app_alert_dialog.dart';
import '../../../provider/global_provider.dart';
import '../../../provider/user_profile_provider.dart';

class SplashViewModel extends BaseViewModel {
  final UserProfileProvider? _userProvider;
  final GlobalProvider _globalProvider;
  SplashViewModel({required BuildContext context})
      : _userProvider = context.read<UserProfileProvider>(),
        _globalProvider = context.read<GlobalProvider>();

  String get appVersion => _globalProvider.appVersion;
  String get appBuildNumber => _globalProvider.appBuildNumber;

  // final _userProfileRepo = UserProfileRepo();

  Future<void> getAppVersion(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (context.mounted) {
      final globalProvider = context.read<GlobalProvider>();
      globalProvider.appVersion = packageInfo.version;
      globalProvider.appBuildNumber = packageInfo.buildNumber;
    }
    notifyListeners();
  }

  void onInitViewModel(
    BuildContext context, {
    required bool popScreen,
  }) async {
    loadingMain = true;
    await initViewModel(context, popScreen: popScreen);
    loadingMain = false;
  }

  Future<void> onRefresh(BuildContext context,
      {required bool popScreen}) async {
    msgError = null;
    loadingMain = true;
    await initViewModel(context, popScreen: popScreen);
    loadingMain = false;
  }

  Future<void> initViewModel(
    BuildContext context, {
    required bool popScreen,
  }) async {
    await getAppVersion(context);
    await Future.delayed(const Duration(milliseconds: 3000))
        .then((value) async {
      if (context.mounted) {
        await getAppVersion(context);
      }
      if (context.mounted) {
        await getUserUniqueKey(context, popScreen: popScreen);
      }
    });
  }

  UserProfile? get userProfile => _userProvider?.userProfile;
  set userProfile(UserProfile? value) => _userProvider?.userProfile = value;

  Future<void> getUserUniqueKey(
    BuildContext context, {
    required bool popScreen,
  }) async {
    if (context.mounted) {
      // AppAlertDialog.error(
      //   context,
      //   textError: 'ไม่สามารถใช้งานบัญชีนี้ได้',
      //   barrierDismissible: false,
      // );
      // AppNav.toNameAndRemoveUntil(context, AppNavConstants.REGISTER);
    }
  }
}
