// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/base_viewmodel.dart';
import '../../../../core/init/shared_perferences/shared_perferences.dart';
import '../../../../core/model/otp/otp_sms_model.dart';
import '../../../../provider/user_profile_provider.dart';
// import '../../../../repo/global_repo.dart';
import '../../../../repo/login_singup_repo.dart';
import '../repo/sms_repo.dart';

class OtpLoginViewModel extends BaseViewModel {
  final UserProfileProvider _userProvider;
  // final GlobalProvider _globalProvider;
  OtpLoginViewModel({required BuildContext context})
      : _userProvider = context.read<UserProfileProvider>();
  //  : _globalProvider = context.read<GlobalProvider>();

  final _otpSendRepo = OtpSendRepo();
  // final _userProfileRepo = UserProfileRepo();
  // final _globalRepo = GlobalRepo();

  final _loginSingupRepo = LoginSingupRepo();

  int count = 60;
  bool _isSetNewOtp = true;
  String _otpNumber = '';
  String get otpNumber => _otpNumber;
  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  set setphoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  set otpNumberValue(String value) {
    _otpNumber = value;
    notifyListeners();
  }

  bool get isSetNewOtp => _isSetNewOtp;
  set(isSetNewOtp) {
    _isSetNewOtp = isSetNewOtp;
    notifyListeners();
  }

  String _otp = '';
  String get otp => _otp;
  set otp(String value) => _otp = value;

  final formOtpKey = GlobalKey<FormState>();

  Future<void> prepareInfoOtp() async {
    try {
      // Map bodyData = {
      //   "otp": otp,
      // };
      // await postOtp(bodyData: bodyData);
    } catch (e) {
      rethrow;
    }
  }

  void onInit(BuildContext context) {
    loading = true;
    init(context);
    loading = false;
  }

  Future<void> init(BuildContext context) async {
    _otpModel = await getArguments(context);
    _phoneNumber = _otpModel?.data?.result?.phoneNumber ?? '';
  }

  Future<void> postOtpvalidate({
    required String? otp,
  }) async {
    try {
      loading = true;
      await _otpSendRepo.sendOtpByTokenAndPhoneNumber(
        otp: otp,
        token: _otpModel?.data?.result?.token,
      );
      final response = await _loginSingupRepo.login(phoneNumber: phoneNumber);
      _userProvider.userProfile = response?.data?.userData;
      await Singleton.shared.setTokenApi(response?.data?.accessToken ?? '');
      await Singleton.shared.setUserId(response?.data?.userData?.id ?? 0);
      await Singleton.shared.setName(response?.data?.userData?.fullName ?? '');
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }

  OtpMoldel? _otpModel;
  OtpMoldel? get otpModel => _otpModel;
  set otpModel(OtpMoldel? value) {
    _otpModel = value;
    notifyListeners();
  }

  void toggleIsSetNewOtp() {
    _isSetNewOtp = !_isSetNewOtp;
    notifyListeners();
  }

  // Future smsPost({required String phoneNumber}) async {
  //   try {
  //     loading = true;
  //     await _otpSendRepo.sendOtpByPhoneNumber(phoneNumber: phoneNumber);

  //     loading = false;
  //   } catch (e) {
  //     loading = false;
  //     rethrow;
  //   }
  // }
}
