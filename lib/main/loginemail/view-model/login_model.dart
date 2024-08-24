// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:ajev_application/main/homeviewbottomBar/view/homebottomBarView.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/user_data_providart.dart';
import '../../../screen/load_screen_page.dart';
import '../../../utils/base/base_viewmodel.dart';
import '../../homeview/view/startPage.dart';
import '../repo/sigin_repo.dart';

class LoginModel extends BaseViewModel {
  UserDataProvider userDataProvider;
  final SigninRepo signinRepo = SigninRepo();

  LoginModel({required BuildContext context})
      : userDataProvider = context.watch<UserDataProvider>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isOTPSent = false;
  bool get isOTPSent => _isOTPSent;
  set isOTPSent(bool value) {
    _isOTPSent = value;
    notifyListeners();
  }

  bool _isCheckboxChecked = false;
  bool get isCheckboxChecked => _isCheckboxChecked;
  set isCheckboxChecked(bool value) {
    _isCheckboxChecked = value;
    notifyListeners();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  Future<void> sendOTP(BuildContext context) async {
    if (!isValidEmail(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email format")),
      );
      return;
    }

    if (_isLoading) return;
    isLoading = true;

    try {
      bool result = await EmailOTP.sendOTP(email: emailController.text);
      isLoading = false;
      if (result) {
        isOTPSent = true;
        startOTPTimer(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP has been sent")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to send OTP")),
        );
      }
    } catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error sending OTP")),
      );
    }
  }

  void startOTPTimer(BuildContext context) {
    Timer(const Duration(seconds: 30), () {
      isOTPSent = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You can resend the OTP now")),
      );
    });
  }

  Future<void> verifyOTP(BuildContext context) async {
    if (_isLoading) return; // Prevent multiple requests
    isLoading = true;
    try {
      bool result = await EmailOTP.verifyOTP(otp: otpController.text);
      isLoading = false;
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP verified successfully")),
        );
        login(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid OTP")),
        );
      }
    } catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error verifying OTP")),
      );
    }
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    try {
      final response = await signinRepo.signIn(
        email: emailController.text,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login successful")),
        );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const LoadPage(nextPage: HomeBottomBarView())),
            (Route<dynamic> route) => false);
        dispose();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("ไม่พบรหัสผ่าน")),
        );
        return;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error during login")),
      );
    } finally {
      isLoading = false;
    }
  }

  void toggleCheckbox(bool? value) {
    isCheckboxChecked = value ?? false;
    notifyListeners();
  }

  bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$",
    );
    return emailRegExp.hasMatch(email);
  }
}
