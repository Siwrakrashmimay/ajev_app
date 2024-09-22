// ignore_for_file: unnecessary_getters_setters

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/base_viewmodel.dart';
import '../../../../core/init/shared_perferences/shared_perferences.dart';
import '../../../../core/model/otp/otp_sms_model.dart';
import '../../../../core/utility/formatters.dart';
import '../../../../provider/global_provider.dart';
// import '../../../../repo/global_repo.dart';
import '../../../../repo/login_singup_repo.dart';
import '../../otp/repo/sms_repo.dart';

class LoginViewModel extends BaseViewModel {
  // final UserProfileProvider _userProvider;
  final GlobalProvider _globalProvider;
  LoginViewModel({required BuildContext context})
      // : _userProvider = context.read<UserProfileProvider>(),
      : _globalProvider = context.read<GlobalProvider>();

  // final _userProfileRepo = UserProfileRepo();
  // final _globalRepo = GlobalRepo();
  final _loginSingupRepo = LoginSingupRepo();

  // bool _isPasswordVisible = true;
  // bool get isPasswordVisible => _isPasswordVisible;

  // set isPasswordVisible(bool value) {
  //   _isPasswordVisible = value;
  //   notifyListeners();
  // }
  final _otpSendRepo = OtpSendRepo();

  String _userName = '';
  String get userName => _userName;
  set userName(String value) => _userName = value;

  final formLoginKey = GlobalKey<FormState>();

  String get appVersion => _globalProvider.appVersion;
  String get appBuildNumber => _globalProvider.appBuildNumber;

  // Future<void> prepareInfoLogin() async {
  //   try {
  //     // Map bodyData = {
  //     //   "email": userName,
  //     //   "password": password,
  //     // };
  //     // await postLogin(bodyData: bodyData);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  OtpMoldel? _otpModel;
  OtpMoldel? get otpModel => _otpModel;
  set otpModel(OtpMoldel? value) => _otpModel = value;

  Future smsPost(BuildContext context, {required String phoneNumber}) async {
    try {
      loading = true;
      await _loginSingupRepo.finduser(phoneNumber: phoneNumber);
      _otpModel =
          await _otpSendRepo.sendOtpByPhoneNumber(phoneNumber: phoneNumber);
      _otpModel?.data?.result?.phoneNumber = phoneNumber;

      loading = false;
    } catch (e) {
      msgError = '$e';
      loading = false;
      rethrow;
    }
  }

  Future<void> postLogin({
    required Map bodyData,
  }) async {
    try {
      // final response = await _authRepo.postLogin(bodyData: bodyData);

      // await prepareInfoUpdateUser(userId: response.data?.userData?.id);

      // _userProfileProvider.userProfile = response.data?.userData;
      // await Singleton.shared.setTokenApi(response.data?.accessToken ?? '');
      // await Singleton.shared.setUserId(response.data?.userData?.id ?? 0);
      // await Singleton.shared.setRole(response.data?.userData?.role?.name ?? '');
      // await Singleton.shared.setName(response.data?.userData?.fullName ?? '');
      // await _globalRepo.setExpiresAt();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> prepareInfoUpdateUser({
    required int? userId,
  }) async {
    try {
      String? fcmToken = await Singleton.shared.getFcmToken();

      if (emptyToNull(fcmToken) == null) {
        fcmToken = await FirebaseMessaging.instance.getToken();
        await Singleton.shared.setFcmToken(fcmToken ?? '');
        fcmToken = await Singleton.shared.getFcmToken();
      }

      if (emptyToNull(fcmToken) == null) {
        throw 'ไม่พบ fcmToken กรุณาปิดแอปพลิเคชันแล้วเปิดใหม่อีกครั้ง';
      }

      // final platform = AppPlatform.instance.platform;

      // Map bodyData = {
      //   "fcmToken": emptyToNull(fcmToken),
      //   "platform": emptyToNull(platform),
      //   "lastLoginAtApp": formatToUtcString(DateTime.now()),
      // };

      // await putUpdateUser(userId: userId, bodyData: bodyData);
    } catch (e) {
      rethrow;
    }
  }
}
