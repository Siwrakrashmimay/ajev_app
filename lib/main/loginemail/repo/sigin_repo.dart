import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../Provider/db_provider.dart';
import '../../../core/services/base_url.dart';
import '../model/user_model.dart';

class SigninRepo {
  String? token;
  UserData _userdata = UserData();

  UserData get userdata => _userdata;
  set userdata(UserData value) {
    _userdata = value;
  }

  Future<http.Response> signIn({
    required String email,
  }) async {
    String url = ApiEndpoint.instance.baseUrl + ApiEndpoint.login;

    _userdata.email = email;

    Map<String, dynamic> requestBody = _userdata.toJson();
    try {
      print('requestBody ${requestBody}');
      http.Response req = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );
      Map<String, dynamic> res = jsonDecode(req.body);
      debugPrint('res before try ${res['response_status']}');
      if (res['response_status'] == 'SUCCESS') {
        debugPrint('signinbody ${req.body}');
        // print('test===${req}');

        final userId = res['data']['id'];
        final token = res['data']['token'];
        DatabaseProvider().saveToken(token);
        DatabaseProvider().saveUserId(userId);
        debugPrint('token = $token');
      } else {
        debugPrint('Login Failer: ${req.body}');
      }

      return req;
    } catch (error) {
      // Handle any errors that occur during the HTTP request
      debugPrint('Error during Login: $error');

      return http.Response('Error during registration: $error', 500);
    }
  }
}
