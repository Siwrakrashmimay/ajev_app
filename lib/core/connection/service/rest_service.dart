import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';

import '../../../main.dart';
import '../../init/constants/app/api_endpoints.dart';
import '../../init/shared_perferences/shared_perferences.dart';
import '../../model/upload_multiple_files/file_with_path_model.dart';
import '../../model/upload_multiple_files/files_with_paths_list_model.dart';
import '../../utility/app_alert_dialog.dart';
import '../../utility/formatters.dart';

final Singleton _singleton = Singleton();

class HeadersService {
  Future<Map<String, String>> headersJson() async {
    String? tokenApi = await _singleton.getTokenApi();
    // debugPrint('Bearer => $tokenApi');
    Map<String, String> headersJson = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $tokenApi',
    };
    return headersJson;
  }

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
  static _authen(http.Response response) async {
    if (response.statusCode case (401 || 403)) {
      debugPrint('response.statusCode => ${response.statusCode}');
      debugPrint('response.body => ${response.body}');
      final singleton = Singleton();
      await singleton.clearAll();
      if (navigatorKey.currentContext!.mounted) {
        // AppNav.toNameAndRemoveUntil(
        //   navigatorKey.currentContext!,
        //   AppNavConstants.LOGIN,
        // );
        String textError = response.statusCode == 401
            ? 'ไม่ได้รับอนุญาต'
            : 'เซสชันหมดอายุ กรุณาเข้าสู่ระบบใหม่';
        AppAlertDialog.error(
          navigatorKey.currentContext!,
          textError: textError,
        );
      }
      throw response.body;
    }
  }

  static _serverError(http.Response response) async {
    if (response.statusCode case (404)) {
      debugPrint('response.statusCode => ${response.statusCode}');
      debugPrint('response.body => ${response.body}');
      String textError =
          response.statusCode == 404 ? 'Not Found' : 'Internal Server Error';
      throw textError;
    }
  }

  static Future getWithAuthAPI(
      {required String urlPath, bool print = false}) async {
    dynamic responseJson;
    try {
      debugPrint('URL_GET: ${ApiEndpoint.instance.endPoint}$urlPath');
      var stopwatch = Stopwatch()..start();
      final response = await http.get(
        headers: await HeadersService().headersJson(),
        Uri.parse('${ApiEndpoint.instance.endPoint}$urlPath'),
      );
      stopwatch.stop();
      ConvertTimeModel time = convertTime(
        stopwatch: stopwatch.elapsedMilliseconds,
      );
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      await _authen(response);
      await _serverError(response);
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
        if (print) {
          debugPrint('BODY_DATA: ${printJsonBody(jsonDecode(response.body))}');
        }
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด';
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

  static Future putWithAuthAPI(
      {required String urlPath, Map? bodyData, bool noBody = false}) async {
    dynamic responseJson;
    try {
      debugPrint('URL_PUT: ${ApiEndpoint.instance.endPoint}$urlPath');
      debugPrint('BODY_DATA: ${printJsonBody(bodyData)}');
      var stopwatch = Stopwatch()..start();
      final response = await http.put(
          headers: await HeadersService().headersJson(),
          Uri.parse('${ApiEndpoint.instance.endPoint}$urlPath'),
          body: !noBody ? jsonEncode(bodyData) : null);
      stopwatch.stop();
      ConvertTimeModel time =
          convertTime(stopwatch: stopwatch.elapsedMilliseconds);
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      await _authen(response);
      await _serverError(response);
      debugPrint('response => ${response.body}');
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด';
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

  static Future postWithAuthAPI({
    required String urlPath,
    Map? bodyData,
    bool noBody = false,
    bool printBody = true,
  }) async {
    dynamic responseJson;
    try {
      debugPrint('URL_POST: ${ApiEndpoint.instance.endPoint}$urlPath');
      if (printBody) {
        debugPrint('BODY_DATA: ${printJsonBody(bodyData)}');
      }
      var stopwatch = Stopwatch()..start();
      final response = await http.post(
          headers: await HeadersService().headersJson(),
          Uri.parse('${ApiEndpoint.instance.endPoint}$urlPath'),
          body: !noBody ? jsonEncode(bodyData) : null);
      stopwatch.stop();
      ConvertTimeModel time =
          convertTime(stopwatch: stopwatch.elapsedMilliseconds);

      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");

      await _authen(response);
      await _serverError(response);
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด';
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

  static Future deleteWithAuthAPI(
      {required String urlPath, Map? bodyData, bool noBody = false}) async {
    dynamic responseJson;
    try {
      debugPrint('URL_DELETE: ${ApiEndpoint.instance.endPoint}$urlPath');
      debugPrint('BODY_DATA: ${printJsonBody(bodyData)}');
      var stopwatch = Stopwatch()..start();
      final response = await http.delete(
          headers: await HeadersService().headersJson(),
          Uri.parse('${ApiEndpoint.instance.endPoint}$urlPath'),
          body: !noBody ? jsonEncode(bodyData) : null);
      stopwatch.stop();
      ConvertTimeModel time =
          convertTime(stopwatch: stopwatch.elapsedMilliseconds);
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      await _authen(response);
      await _serverError(response);
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด';
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

  static Future postUploadSingleFileWithAuthAPI({
    required FileWithPathModel bodyData,
  }) async {
    dynamic responseJson;
    try {
      String? mainPath = bodyData.mainPath;
      String? subPath = bodyData.subPath;
      String? fileName = bodyData.folderName;
      String? filePath = bodyData.filePath?.filePath;
      subPath = "${subPath.replaceAll(" ", "-")}/$fileName";

      debugPrint(
          'URL_POST: ${ApiEndpoint.instance.endPoint}${ApiEndpoint.instance.filesUpload}');
      String name = (filePath ?? '').split('/').last;
      String extention = name.substring(name.lastIndexOf('.'));
      debugPrint('BODY_DATA: ${printJsonBody({
            "mainPath": bodyData.mainPath,
            "subPath": subPath,
            "file": {
              "filename": "$fileName$extention",
              "path": filePath,
            }
          })}');
      var stopwatch = Stopwatch()..start();
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${ApiEndpoint.instance.endPoint}${ApiEndpoint.instance.filesUpload}',
        ),
      );
      request.headers['Content-Type'] = 'multipart/form-data; charset=utf-8';
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          filePath ?? '',
          filename: '$fileName$extention',
          contentType: MediaType('image', 'png'),
        ),
      );

      request.fields['mainPath'] = mainPath;
      request.fields['subPath'] = subPath;

      http.StreamedResponse streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      stopwatch.stop();
      ConvertTimeModel time =
          convertTime(stopwatch: stopwatch.elapsedMilliseconds);
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");

      await _authen(response);
      await _serverError(response);
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด';
      } else {
        throw '( ${response.statusCode} ) ${response.reasonPhrase}';
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

  static Future postUploadMultipleFileWithAuthAPI({
    required FilesWithPathsListModel bodyData,
  }) async {
    dynamic responseJson;
    try {
      String? mainPath = bodyData.mainPath;
      String? subPath = bodyData.subPath;
      String? fileName = bodyData.folderName;
      subPath = "${subPath.replaceAll(" ", "-")}/$fileName";

      debugPrint(
          'URL_POST: ${ApiEndpoint.instance.endPoint}${ApiEndpoint.instance.filesUploads}');
      debugPrint('BODY_DATA: ${printJsonBody({
            "mainPath": bodyData.mainPath,
            "subPath": subPath,
            "files": bodyData.filePathList.map(
              (e) {
                String name = (e.filePath ?? '').split('/').last;
                String extention = name.substring(name.lastIndexOf('.'));
                return {
                  "filename": '${e.filename}$extention',
                  "path": e.filePath,
                };
              },
            ).toList(),
          })}');
      var stopwatch = Stopwatch()..start();
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${ApiEndpoint.instance.endPoint}${ApiEndpoint.instance.filesUploads}',
        ),
      );
      request.headers['Content-Type'] = 'multipart/form-data; charset=utf-8';
      for (var path in bodyData.filePathList) {
        String name = (path.filePath ?? '').split('/').last;
        String extention = name.substring(name.lastIndexOf('.'));
        request.files.add(
          await http.MultipartFile.fromPath(
            'files',
            path.filePath ?? '',
            filename: '${path.filename}$extention',
            contentType: MediaType('image', 'png'),
          ),
        );
      }
      request.fields['mainPath'] = mainPath;
      request.fields['subPath'] = subPath;

      http.StreamedResponse streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      stopwatch.stop();
      ConvertTimeModel time =
          convertTime(stopwatch: stopwatch.elapsedMilliseconds);
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");

      await _authen(response);
      await _serverError(response);
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        responseJson = jsonDecode(response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด';
      } else {
        throw '( ${response.statusCode} ) ${response.reasonPhrase}';
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

//   static Future deleteWithAuthAPI({
//     required String urlPath,
//     bool print = false,
//     bool printJson = false,
//     Uri? endPointLocal,
//   }) async {
//     try {
//       debugPrint('URL_GET: ${endPointLocal ?? endPoint}$urlPath');
//       var stopwatch = Stopwatch()..start();
//       final response = await http.delete(
//         headers: HeadersService.headersJson,
//         Uri.parse('${endPointLocal ?? endPoint}$urlPath'),
//       );
//       stopwatch.stop();
//       ConvertTimeModel time =
//           convertTime(stopwatch: stopwatch.elapsedMilliseconds);
//       debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
//       if (print) {
//         !printJson
//             ? debugPrint('response => ${response.body}')
//             : debugPrint(
//                 'response => ${printJsonBody(jsonDecode(response.body))}');
//       }

//       final jsonDe = jsonDecode(response.body);
//       if (jsonDe['response_status'] == SUCCESSSTT) {
//         if (print) {
//           !printJson
//               ? debugPrint('response => ${response.body}')
//               : debugPrint(
//                   'response => ${printJsonBody(jsonDecode(response.body))}');
//         }
//         return Success(response: response.body);
//       } else if (jsonDe['response_status'] == ERRORSTT) {
//         debugPrint('response => ${printJsonBody(jsonDecode(response.body))}');
//         return Failure(
//           code: response.statusCode,
//           errorResponse: '${jsonDe['message']}',
//         );
//       } else {
//         debugPrint('response => $MSG_INVALID_RESPONSE');
//         return Failure(
//           code: INVALID_RESPONSE,
//           errorResponse: MSG_INVALID_RESPONSE,
//         );
//       }
//     } on HttpException {
//       debugPrint('response => $MSG_NO_INTERNET');
//       return Failure(code: NO_INTERNET, errorResponse: MSG_NO_INTERNET);
//     } on SocketException {
//       debugPrint('response => $MSG_NO_INTERNET');
//       return Failure(code: NO_INTERNET, errorResponse: MSG_NO_INTERNET);
//     } on FormatException {
//       debugPrint('response => $MSG_INVALID_FORMAT');
//       return Failure(code: INVALID_FORMAT, errorResponse: MSG_INVALID_FORMAT);
//     } on TimeoutException {
//       debugPrint('response => $MSG_TIME_OUT');
//       return Failure(code: TIME_OUT, errorResponse: MSG_TIME_OUT);
//     } catch (e) {
//       debugPrint('response => $MSG_UNKNOWN_ERROR');
//       return Failure(code: UNKNOWN_ERROR, errorResponse: MSG_UNKNOWN_ERROR);
//     }
//   }

//   static Future postSMSOTP({
//     required String urlPath,
//     bodyData,
//   }) async {
//     try {
//       debugPrint('URL_POST_Send_OTP: $endPointOTP$urlPath');
//       printLongJson(bodyData);
//       var stopwatch = Stopwatch()..start();
//       final response = await http.post(
//           headers: HeadersService.headersSendOTP,
//           Uri.parse('$endPointOTP$urlPath'),
//           body: jsonEncode(bodyData));
//       debugPrint('response => ${response.body}');
//       stopwatch.stop();
//       ConvertTimeModel time =
//           convertTime(stopwatch: stopwatch.elapsedMilliseconds);
//       debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
//       if (response.statusCode == SUCCESS) {
//         debugPrint('response => ${printJsonBody(jsonDecode(response.body))}');
//         return Success(response: response.body);
//       } else {
//         debugPrint('response => ${printJsonBody(jsonDecode(response.body))}');
//         return Failure(
//           code: response.statusCode,
//           errorResponse: MSG_INVALID_RESPONSE,
//         );
//       }
//     } on HttpException {
//       debugPrint('response => $MSG_NO_INTERNET');
//       return Failure(code: NO_INTERNET, errorResponse: MSG_NO_INTERNET);
//     } on SocketException {
//       debugPrint('response => $MSG_NO_INTERNET');
//       return Failure(code: NO_INTERNET, errorResponse: MSG_NO_INTERNET);
//     } on FormatException {
//       debugPrint('response => $MSG_INVALID_FORMAT');
//       return Failure(code: INVALID_FORMAT, errorResponse: MSG_INVALID_FORMAT);
//     } on TimeoutException {
//       debugPrint('response => $MSG_TIME_OUT');
//       return Failure(code: TIME_OUT, errorResponse: MSG_TIME_OUT);
//     } catch (e) {
//       debugPrint('response => $MSG_UNKNOWN_ERROR');
//       return Failure(code: UNKNOWN_ERROR, errorResponse: MSG_UNKNOWN_ERROR);
//     }
//   }

  // static Future postUploadMultipleFileWithAuthAPI({
  //   required String folderName,
  //   required String filename,
  //   required String filePath,
  // }) async {
  //   dynamic responseJson;
  //   try {
  //     debugPrint(
  //         'URL_POST: ${ApiEndpoint.instance.endPoint}${ApiEndpoint.instance.uploads}');
  //     debugPrint('BODY_DATA: ${jsonEncode(filePath)}');
  //     var stopwatch = Stopwatch()..start();
  //     final request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse(
  //         '${ApiEndpoint.instance.endPoint}${ApiEndpoint.instance.uploads}',
  //       ),
  //     );
  //     String fileName = filePath.split('/').last;
  //     String extention = fileName.substring(fileName.lastIndexOf('.'));
  //     request.headers['Content-Type'] = 'multipart/form-data; charset=utf-8';
  //     request.files.add(
  //       await http.MultipartFile.fromPath(
  //         'files',
  //         filePath,
  //         filename: '$filename$extention',
  //         contentType: MediaType('image', 'png'),
  //       ),
  //     );

  //     request.fields['pathFile'] = folderName;
  //     request.fields['subPathFile'] =
  //         '${(await _singleton.getName()).replaceAll(" ", "-")}/$filename';

  //     http.StreamedResponse streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);
  //     stopwatch.stop();
  //     ConvertTimeModel time =
  //         convertTime(stopwatch: stopwatch.elapsedMilliseconds);
  //     debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
  //     if (response.statusCode case (401 || 403)) {
  //       debugPrint('response.statusCode => ${response.statusCode}');
  //       debugPrint('response.body => ${response.body}');
  //       final singleton = Singleton();
  //       await singleton.clearAll();
  //       if (navigatorKey.currentContext!.mounted) {
  //         AppNav.toNameAndRemoveUntil(
  //           navigatorKey.currentContext!,
  //           AppNavConstants.LOGIN,
  //         );
  //         String textError = response.statusCode == 401
  //             ? 'ไม่ได้รับอนุญาต'
  //             : 'เซสชันหมดอายุ กรุณาเข้าสู่ระบบใหม่';
  //         AppAlertDialog.error(
  //           navigatorKey.currentContext!,
  //           textError: textError,
  //         );
  //       }
  //       throw response.body;
  //     } else if (response.statusCode case (500 || 404)) {
  //       String textError =
  //           response.statusCode == 404 ? 'Not Found' : 'Internal Server Error';
  //       throw textError;
  //     }
  //     final jsonDe = jsonDecode(response.body);
  //     if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
  //       responseJson = response.body;
  //     } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
  //       debugPrint('${jsonDe['message']}');
  //       throw '${jsonDe['message']}';
  //     } else {
  //       throw '( ${response.statusCode} ) ${response.reasonPhrase}';
  //     }
  //   } on HttpException {
  //     throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
  //   } on SocketException {
  //     throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
  //   } on TimeoutException {
  //     throw '(${ApiEndpoint.TIME_OUT}) ${ApiEndpoint.MSG_TIME_OUT}';
  //   }
  //   return responseJson;
  // }

  static Future<http.Response> getVersionStore({required Uri uri}) async {
    try {
      debugPrint('URL_GET: $uri');
      var stopwatch = Stopwatch()..start();
      final response = await http.get(uri);
      stopwatch.stop();
      ConvertTimeModel time = convertTime(
        stopwatch: stopwatch.elapsedMilliseconds,
      );
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      await _serverError(response);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw "Invalid response code: ${response.statusCode}";
      }
    } on HttpException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on SocketException {
      throw '(${ApiEndpoint.NO_INTERNET}) ${ApiEndpoint.MSG_NO_INTERNET}';
    } on TimeoutException {
      throw '(${ApiEndpoint.TIME_OUT}) ${ApiEndpoint.MSG_TIME_OUT}';
    }
  }
}

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
