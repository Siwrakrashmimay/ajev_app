// ignore_for_file: constant_identifier_names

class ApiEndpoint {
  ApiEndpoint._init();
  static final ApiEndpoint _instance = ApiEndpoint._init();
  static ApiEndpoint get instance => _instance;

  // String get endPoint => 'https://zillion-service.poonework.com';
  String get endPoint => 'http://192.168.1.45:8081';

  //Auth
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const finduser = '/auth/findUser';

  // //Users
  // static const usersByRole = '/role/get-user-by-role';
  static const users = '/users';
  // static const checkEmail = '/users/check-email';
  // static const updateUsers = '/users';
  // static const updatePassword = '/users/update-password';

  // //SalesPlannerType
  // static const salesPlannerTypeActiveFlag = '/sales-planner-type/active-flag';

  // //CustomerGrade
  // static const customerGradeActiveFlag = '/customer-grade/active-flag';

  // //CustomerType
  // static const customerTypeActiveFlag = '/customer-type/active-flag';

  // //Customer
  // static const customerDropDown = '/customer/drop-down';

  // //AgencyType
  // static const agencyTypes = '/agency/active-flag';

  // //ProjectType
  // static const projectTypes = '/project-types/active-flag';

  // //BuidingType
  // static const buildingTypes = '/building-types/active-flag';

  // //ProjectStatus
  // static const projectStatus = '/project-status/active-flag';

  // //TypeOfSurvey
  // static const typeOfSurvey = '/type-of-survey/active-flag';

  // //ProjectGrade
  // static const projectGradeSpec = '/project-grade-spec/active-flag';

  // //ProjectSheet
  // static const projectSheet = '/project-sheet';
  // static const projectSheetDropdwon = '/project-sheet/find-to-dropdown';

  // //SalesPLanner
  // static const salesPlanner = '/sales-planner';
  // static const removeSalesPlanner = '/sales-planner/remove';
  // static const salesPlannerWithDate = '/sales-planner/planner-with-date';

  // //Supervisor
  // static consl supervisorPlanner = '/supervisor-planner';

  // //InstallationWorkTravel
  // static const installationWorkTravel = '/installation-work-travel';
  // //cars
  // static const cars = '/cars';

  // //Product
  // static const productDropdown = '/product/drop-down';

  // //Attendance
  // static const attendanceRecord = '/attendance-record';

  // // find-to-dropdown
  // static const findToDropdown = '/find-to-dropdown';

  // // find-to-dropdown
  // static const findOfWeek = '/find-of-week';

  ///UploadFormData
  String filesUploads = "/files/uploads";
  String filesUpload = "/files/upload";

  // //sendEmailOtp
  // static const sendEmailOtp = '/otp-mailer/send-email-otp';
  // static const verifyEmailOtp = '/otp-mailer/verify-email-otp';

  // sendSmsOtp
  static const sendSmsOtp = '/auth/send-otp';
  static const verifySmsOtp = '/auth/validate-otp';

  //configs
  static const configs = '/config-version';

  // //notification
  // static const notification = '/notification';

  //
  static const itemsPerPage = 'itemsPerPage=';

  //response_status
  static const SUCCESS = "SUCCESS";
  static const ERROR = "ERROR";
  // Errors
  static const NO_INTERNET = 101;
  static const TIME_OUT = 408;

  // NameErrors
  static const MSG_NO_INTERNET = 'ขาดการเชื่อมต่อกับอินเทอร์เน็ต';
  static const MSG_UNKNOWN_ERROR = 'พบข้อมูลบางชนิดไม่ตรงกัน';
  static const MSG_TIME_OUT = 'การเชื่อมต่อหมดเวลาแล้ว กรุณาลองใหม่อีกครั้ง';
}
