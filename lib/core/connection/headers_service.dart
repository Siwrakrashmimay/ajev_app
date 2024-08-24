import '../services/base_url.dart';

class ApiHeader {
  ApiHeader._init();
  static final ApiHeader _instance = ApiHeader._init();
  static ApiHeader get instance => _instance;

  // Future<Map<String, String>> json() async {
  //   String? token = await Singleton().getToken();
  //   Map<String, String> headersJson = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   };
  //   return headersJson;
  // }

  // Future<Map<String, String>> multiPart() async {
  //   String? token = await Singleton().getToken();
  //   Map<String, String> multiPart = {
  //     'Content-Type':
  //         'multipart/form-data; boundary=<calculated when request is sent>',
  //     'Authorization': 'Bearer $token',
  //   };
  //   return multiPart;
  // }

  Map<String, String> smsMKT = {
    'Content-Type': 'application/json',
  };
}
