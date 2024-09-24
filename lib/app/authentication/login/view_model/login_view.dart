// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../core/base/base_viewmodel.dart';
import '../../../../core/init/shared_perferences/shared_perferences.dart';
import '../../../../core/model/otp/otp_sms_model.dart';
import '../../../../repo/login_singup_repo.dart';
import '../../../../provider/global_provider.dart';

class LoginViewModel extends BaseViewModel {
  final GlobalProvider _globalProvider;
  final LoginSingupRepo _loginSingupRepo = LoginSingupRepo();
  // final OtpSendRepo _otpSendRepo = OtpSendRepo();

  LoginViewModel({required BuildContext context})
      : _globalProvider = context.read<GlobalProvider>();

  // Form key for validation
  final formLoginKey = GlobalKey<FormState>();

  // User input fields
  String _userName = '';
  String _otpCode = '';
  bool _agreed = false;

  // Getters and setters
  String get userName => _userName;
  set userName(String value) => _userName = value;

  String get otpCode => _otpCode;
  set otpCode(String value) => _otpCode = value;

  bool get agreed => _agreed;
  set agreed(bool value) => _agreed = value;

  // Application version details
  String get appVersion => _globalProvider.appVersion;
  String get appBuildNumber => _globalProvider.appBuildNumber;

  // OTP model
  OtpMoldel? _otpModel;
  OtpMoldel? get otpModel => _otpModel;
  set otpModel(OtpMoldel? value) => _otpModel = value;

  // Sending OTP via phone number
  Future<void> sendOtp(String phoneNumber) async {
    try {
      loading = true;
      await _loginSingupRepo.finduser(phoneNumber: phoneNumber);
      // _otpModel =
      // await _otpSendRepo.sendOtpByPhoneNumber(phoneNumber: phoneNumber);
      // _otpModel?.data?.result?.phoneNumber = phoneNumber;
      loading = false;
    } catch (e) {
      msgError = e.toString();
      loading = false;
      rethrow;
    }
  }

  // Preparing user data update
  Future<void> prepareInfoUpdateUser({required int? userId}) async {
    try {
      String? fcmToken = await Singleton.shared.getFcmToken();
      if (fcmToken == null) {
        fcmToken = await FirebaseMessaging.instance.getToken();
        await Singleton.shared.setFcmToken(fcmToken ?? '');
      }

      if (fcmToken == null) {
        throw 'FCM Token not found. Please restart the app.';
      }

      // Map bodyData = {
      //   "fcmToken": fcmToken,
      //   "lastLoginAtApp": formatToUtcString(DateTime.now()),
      // };

      // Add API call for updating user data here.
    } catch (e) {
      rethrow;
    }
  }

  // Post login function
  Future<void> postLogin(Map<String, dynamic> bodyData) async {
    try {
      // Handle the login post logic here.
    } catch (e) {
      rethrow;
    }
  }
}
