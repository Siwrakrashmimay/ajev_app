import 'dart:async';
import 'dart:math';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../Provider/user_data_providart.dart';
import '../../../screen/load_screen_page.dart';
import '../../../utils/base/base_viewmodel.dart';
import '../../loginemail/model/user_model.dart';
import '../../loginemail/view/loginemail.dart';
import '../repo/signup_repo.dart';

class AuthViewModel extends BaseViewModel {
  bool _isPasswordVisible = true;
  final SignupRepo _signupRepo = SignupRepo();
  UserDataProvider userDataProvider;

  AuthViewModel({required BuildContext context})
      : userDataProvider = context.watch<UserDataProvider>() {
    EmailOTP.config(
      appName: "Your App Name",
      otpLength: 6,
      otpType: OTPType.numeric,
    );
  }

  UserData? get userdataprov => userDataProvider.userdata;
  set userdataprov(UserData? value) {
    userDataProvider.userdata = value;
    notifyListeners();
  }

  bool get isPasswordVisible => _isPasswordVisible;
  set isPasswordVisible(bool value) {
    _isPasswordVisible = value;
    notifyListeners();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  bool isCheckboxChecked = false;
  bool isOTPSent = false;
  bool canResendOTP = true; // flag to control the "Send" button state

  Future<void> sendOTP(BuildContext context) async {
    if (canResendOTP) {
      loadingMain = true;
      notifyListeners();
      bool result = await EmailOTP.sendOTP(email: emailController.text);
      loadingMain = false;
      if (result) {
        isOTPSent = true;
        canResendOTP = false; // disable the "Send" button
        notifyListeners();
        startOTPTimer(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('OTP has been sent')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to send OTP')),
        );
        msgError = "Failed to send OTP";
        notifyListeners();
      }
    }
  }

  void startOTPTimer(BuildContext context) {
    Timer(const Duration(seconds: 30), () {
      canResendOTP = true;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can resend the OTP now')),
      );
    });
  }

  Future<void> verifyOTP(BuildContext context) async {
    bool result = await EmailOTP.verifyOTP(otp: otpController.text);
    if (result) {
      signupFunc(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP has been verified')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP')),
      );
      msgError = "Invalid OTP";
      notifyListeners();
    }
  }

  Future<void> signupFunc(BuildContext context) async {
    try {
      final response = await _signupRepo.signUp(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        email: emailController.text,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User registered successfully')),
        );
        firstNameController.clear();
        lastNameController.clear();
        phoneNumberController.clear();
        emailController.clear();
        otpController.clear();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoadPage(nextPage: LoginRegisterPage()),
          ),
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const LoadPage(nextPage: LoginRegisterPage()),
        //   ),
        // );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to register user')),
        );
        msgError = "Failed to register user";
        notifyListeners();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred during registration')),
      );
      msgError = "An error occurred during registration";
      notifyListeners();
    }
  }

  void toggleCheckbox(bool? value) {
    isCheckboxChecked = value ?? false;
    notifyListeners();
  }
}
