import '../../../../core/connection/service/rest_service.dart';
import '../../../../core/init/constants/app/api_endpoints.dart';
import '../../../../core/model/otp/otp_sms_model.dart';

class OtpSendRepo {
  Future<OtpMoldel?> sendOtpByPhoneNumber(
      {required String? phoneNumber}) async {
    try {
      var response = await RestService.postWithAuthAPI(
          urlPath: ApiEndpoint.sendSmsOtp,
          bodyData: {'phoneNumber': phoneNumber});
      return OtpMoldel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<OtpMoldel?> sendOtpByTokenAndPhoneNumber(
      {required String? otp, required String? token}) async {
    try {
      var response = await RestService.postWithAuthAPI(
          urlPath: ApiEndpoint.verifySmsOtp,
          bodyData: {
            'token': token,
            'otpCode': otp,
          });
      return OtpMoldel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
