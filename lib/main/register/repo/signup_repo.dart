import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/services/base_url.dart';
import '../../loginemail/model/user_model.dart';

class SignupRepo {
  UserData _userdata = UserData();

  UserData get userdata => _userdata;
  set userdata(UserData value) {
    _userdata = value;
  }

  Future<http.Response> signUp({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
  }) async {
    String url = ApiEndpoint.instance.baseUrl + ApiEndpoint.signUp;

    _userdata.email = email;
    _userdata.firstname = firstName;
    _userdata.lastname = lastName;

    Map<String, dynamic> requestBody = _userdata.toJson();
    try {
      // Send an HTTP POST request to register the user
      http.Response req = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      return req;
    } catch (error) {
      // Handle any errors that occur during the HTTP request
      debugPrint('Error during registration: $error');
      return http.Response('Error during registration: $error', 500);
    }
  }
}
