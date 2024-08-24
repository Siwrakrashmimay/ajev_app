import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../services/base_url.dart';

class ConvertTimeModel {
  final int? ms;
  final double? s;

  ConvertTimeModel({
    this.ms,
    this.s,
  });
}

ConvertTimeModel convertTime({required int stopwatch}) {
  Duration duration = Duration(milliseconds: stopwatch);
  double seconds = duration.inMilliseconds / (1000);
  return ConvertTimeModel(
    ms: duration.inMilliseconds,
    s: seconds,
  );
}

class HeadersService {
  static Map<String, String> headersJson = {
    'Content-Type': 'application/json',
    // 'Authorization': 'Bearer $tokenApi',
  };

  static Map<String, String> headersMultiPart = {
    'Content-Type':
        'multipart/form-data; boundary=<calculated when request is sent>',
    // 'Authorization': 'Bearer $tokenApi',
  };

  static Map<String, String> headersSendOTP = {
    'Content-Type': 'application/json',
    'api_key': 'bdebe606fffc115f7167877fed53d472',
    'secret_key': 'u6enBazEqJ3vfN9S',
  };
}

class RestService {
  static Future getWithAuthAPI({required String urlPath}) async {
    dynamic responseJson;
    try {
      debugPrint('URL_GET: $urlPath');
      var stopwatch = Stopwatch()..start();
      final response = await http.get(
        headers: HeadersService.headersJson,
        Uri.parse('${ApiEndpoint.instance.endPoint}$urlPath'),
      );
      stopwatch.stop();
      ConvertTimeModel time = convertTime(
        stopwatch: stopwatch.elapsedMilliseconds,
      );
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw '${jsonDe['message']}';
      }
    } on HttpException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on SocketException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on TimeoutException {
      throw '(${ApiEndpoint.TIME_OUT}) ${ApiEndpoint.MSG_TIME_OUT}';
    }
    return responseJson;
  }

  static Future postWithAuthAPI(
      {required String urlPath, bodyData, bool noBody = false}) async {
    try {
      dynamic responseJson;
      debugPrint('URL_POST: ${ApiEndpoint.instance.baseUrl}$urlPath');
      debugPrint('BODY_DATA: ${jsonEncode(bodyData)}');
      var stopwatch = Stopwatch()..start();
      final response = await http.post(
          headers: HeadersService.headersJson,
          Uri.parse('${ApiEndpoint.instance.baseUrl}$urlPath'),
          body: !noBody ? jsonEncode(bodyData) : null);
      stopwatch.stop();
      ConvertTimeModel time =
          convertTime(stopwatch: stopwatch.elapsedMilliseconds);
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
        return responseJson;
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw '${jsonDe['message']}';
      }
    } on HttpException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on SocketException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on TimeoutException {
      throw '(${ApiEndpoint.TIME_OUT}) ${ApiEndpoint.MSG_TIME_OUT}';
    }
  }

  static Future<dynamic> postPartFileWithAuthAPI({
    required String urlPath,
    required Map<String, String> bodyData,
    required File file,
  }) async {
    try {
      var stopwatch = Stopwatch()..start();
      var uri = Uri.parse('${ApiEndpoint.instance.baseUrl}$urlPath');
      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll(HeadersService.headersJson);

      bodyData.forEach((key, value) {
        request.fields[key] = value;
      });

      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file.path,
        contentType: MediaType('image', 'jpeg'),
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      dynamic responseJson = _processResponse(response);

      stopwatch.stop();
      ConvertTimeModel time =
          convertTime(stopwatch: stopwatch.elapsedMilliseconds);
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
        return responseJson;
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw '${jsonDe['message']}';
      }
      return responseJson;
    } on SocketException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on TimeoutException {
      throw '(${ApiEndpoint.TIME_OUT}) ${ApiEndpoint.MSG_TIME_OUT}';
    }
  }

  static Future<dynamic> postMultiPartFileWithAuthAPI({
    required String urlPath,
    required Map<String, String> bodyData,
    required List<File> files,
  }) async {
    try {
      var stopwatch = Stopwatch()..start();
      var uri = Uri.parse('${ApiEndpoint.instance.baseUrl}$urlPath');
      var request = http.MultipartRequest('POST', uri);
      request.headers['Content-Type'] = 'multipart/form-data; charset=utf-8';

      // ..headers.addAll(HeadersService.headersJson);

      bodyData.forEach((key, value) {
        request.fields[key] = value;
      });

      for (var file in files) {
        request.files.add(await http.MultipartFile.fromPath(
          'files',
          file.path,
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      dynamic responseJson = _processResponse(response);

      stopwatch.stop();
      ConvertTimeModel time =
          convertTime(stopwatch: stopwatch.elapsedMilliseconds);
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      final jsonDe = jsonDecode(response.body);
      // debugPrint(jsonDe);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
        return responseJson;
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw '${jsonDe['message']}';
      }
      return responseJson;
    } on SocketException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on TimeoutException {
      throw '(${ApiEndpoint.TIME_OUT}) ${ApiEndpoint.MSG_TIME_OUT}';
    }
  }

  static dynamic _processResponse(http.Response response) {
    final jsonDe = jsonDecode(response.body);
    if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
      return jsonDe;
    } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
      throw '${jsonDe['message']}';
    } else {
      throw 'Unexpected error';
    }
  }

  static Future putWithAuthAPI({
    required String urlPath,
    bodyData,
    bool noBody = false,
  }) async {
    try {
      dynamic responseJson;
      debugPrint('URL_PUT: ${ApiEndpoint.instance.baseUrl}$urlPath');
      debugPrint('BODY_DATA: ${jsonEncode(bodyData)}');
      var stopwatch = Stopwatch()..start();
      final response = await http.put(
          headers: HeadersService.headersJson,
          Uri.parse('${ApiEndpoint.instance.baseUrl}$urlPath'),
          body: !noBody ? jsonEncode(bodyData) : null);

      stopwatch.stop();
      ConvertTimeModel time =
          convertTime(stopwatch: stopwatch.elapsedMilliseconds);
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
        return responseJson;
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw '${jsonDe['message']}';
      }
    } on HttpException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on SocketException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on TimeoutException {
      throw '(${ApiEndpoint.TIME_OUT}) ${ApiEndpoint.MSG_TIME_OUT}';
    }
  }

  // static Future<dynamic> putWithAuthAPIWithFile({
  //   required String urlPath,
  //   required File file,
  //   required String fileName,
  //   Map<String, String>? fields,
  // }) async {
  //   try {
  //     var uri = Uri.parse('${ApiEndpoint.instance.baseUrl}$urlPath');
  //     var request = http.MultipartRequest('PUT', uri);

  //     request.headers.addAll(HeadersService.headersJson);

  //     request.files.add(await http.MultipartFile.fromPath(
  //       'file',
  //       file.path,
  //       filename: fileName,
  //       contentType: MediaType('image', 'jpeg'),
  //     ));

  //     if (fields != null) {
  //       request.fields.addAll(fields);
  //     }

  //     var stopwatch = Stopwatch()..start();
  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);
  //     stopwatch.stop();
  //     ConvertTimeModel time =
  //         convertTime(stopwatch: stopwatch.elapsedMilliseconds);
  //     debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");

  //     final jsonDe = jsonDecode(response.body);
  //     if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
  //       return jsonDecode(response.body);
  //     } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
  //       throw '${jsonDe['message']}';
  //     } else {
  //       throw 'Error uploading file';
  //     }
  //   } on HttpException {
  //     throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
  //   } on SocketException {
  //     throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
  //   } on TimeoutException {
  //     throw '(${ApiEndpoint.TIME_OUT}) ${ApiEndpoint.MSG_TIME_OUT}';
  //   } catch (e) {
  //     print('Error uploading file: $e');
  //     rethrow; // Re-throw the error to be handled further up
  //   }
  // }

  static Future<dynamic> putWithAuthAPIWithFile({
    required String urlPath,
    required File file,
    required Map<String, String> bodyData,
  }) async {
    try {
      var stopwatch = Stopwatch()..start();
      var uri = Uri.parse('${ApiEndpoint.instance.baseUrl}$urlPath');
      var request = http.MultipartRequest('PUT', uri)
        ..headers.addAll(HeadersService.headersJson);

      bodyData.forEach((key, value) {
        request.fields[key] = value;
      });

      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file.path,
        contentType: MediaType('image', 'jpeg'),
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      debugPrint('response.body => ${response.body}');
      stopwatch.stop();
      ConvertTimeModel time =
          convertTime(stopwatch: stopwatch.elapsedMilliseconds);
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");

      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        return jsonDecode(response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw '${jsonDe['message']}';
      } else {
        throw 'Error uploading file';
      }
    } on HttpException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on SocketException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on TimeoutException {
      throw '(${ApiEndpoint.TIME_OUT}) ${ApiEndpoint.MSG_TIME_OUT}';
    } catch (e) {
      debugPrint('Error uploading file: $e');
      rethrow; // Re-throw the error to be handled further up
    }
  }
}
