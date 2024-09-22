import '../core/connection/service/rest_service.dart';
import '../core/init/constants/app/api_endpoints.dart';
import '../core/model/userprofile/user_profile_data_model.dart';

class UserProfileRepo {
  Future<UserProfileData?> getUserProfile({
    required int? userId,
  }) async {
    try {
      final response = await RestService.getWithAuthAPI(
        urlPath: "${ApiEndpoint.users}/$userId",
      );
      return UserProfileData.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // Future<UserProfileData> postCheckEmail({required Map bodyData}) async {
  //   try {
  //     var response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.checkEmail,
  //       bodyData: bodyData,
  //     );
  //     return UserProfileData.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<UserProfileData> putUpdatePassword({
  //   required int? userId,
  //   required Map bodyData,
  // }) async {
  //   try {
  //     var response = await RestService.putWithAuthAPI(
  //       urlPath: '${ApiEndpoint.updatePassword}/$userId',
  //       bodyData: bodyData,
  //     );
  //     return UserProfileData.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<UserProfileData> putUpdateUser({
  //   required int? userId,
  //   required Map bodyData,
  // }) async {
  //   try {
  //     var response = await RestService.putWithAuthAPI(
  //       urlPath: '${ApiEndpoint.updateUsers}/$userId',
  //       bodyData: bodyData,
  //     );
  //     return UserProfileData.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
