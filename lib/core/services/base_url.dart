// ignore_for_file: constant_identifier_names

class ApiEndpoint {
  ApiEndpoint._init();
  static final ApiEndpoint _instance = ApiEndpoint._init();
  static ApiEndpoint get instance => _instance;
  String get baseUrl => 'http://192.168.100.208:8081';
  String get endPoint => "http://192.168.100.208:8081";
  static const signUp = '/auth/register/';
  static const login = '/auth/login/';
  //Send_SMS_OTP

  //response_status
  static const SUCCESS = "SUCCESS";
  static const ERROR = "ERROR";
  // Errors
  static const NO_INTERNET = 101;
  static const TIME_OUT = 408;
  static const INVALID_RESPONSE = 100;
  static const INVALID_FORMAT = 102;
  static const UNKNOWN_ERROR = 103;

  // NameErrors
  static const MSG_NO_INTERNET = 'ขาดการเชื่อมต่อกับอินเทอร์เน็ต';
  static const MSG_TIME_OUT = 'การเชื่อมต่อหมดเวลาแล้ว กรุณาลองใหม่อีกครั้ง';
}
