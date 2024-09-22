import '../core/connection/service/rest_service.dart';
import '../core/init/constants/app/api_endpoints.dart';
import '../core/model/userprofile/user_profile_data_model.dart';

class LoginSingupRepo {
  Future<UserProfileData?> login({required String? phoneNumber}) async {
    try {
      var response = await RestService.postWithAuthAPI(
          urlPath: ApiEndpoint.login,
          bodyData: {
            'idCardOrTel': phoneNumber,
          });
      return UserProfileData.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileData?> finduser({required String? phoneNumber}) async {
    try {
      var response = await RestService.getWithAuthAPI(
        urlPath: "${ApiEndpoint.finduser}/?idCardOrTel=$phoneNumber",
      );
      return UserProfileData.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileData?> register(
      {required String? phoneNumber,
      required String? idCardNumber,
      required String? email,
      required String? name,
      required String? surname}) async {
    try {
      var response = await RestService.postWithAuthAPI(
          urlPath: ApiEndpoint.register,
          bodyData: {
            'tel': phoneNumber,
            'email': email,
            'id_card_number': idCardNumber,
            'full_name': "$name $surname",
            'role': 'MEMBER',
            'gender': 'MALE',
            'bod': '1990-01-01',
          });
      return UserProfileData.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
