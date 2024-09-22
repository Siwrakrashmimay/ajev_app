import 'package:flutter/material.dart';

import '../core/init/shared_perferences/shared_perferences.dart';
import '../core/model/userprofile/user_profile_model.dart';
import '../core/utility/formatters.dart';
import '../repo/user_profile_repo.dart';

class UserProfileProvider extends ChangeNotifier {
  final Singleton _singleton = Singleton();
  final UserProfileRepo _userProfileRepo = UserProfileRepo();

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;
  set userProfile(UserProfile? value) {
    _userProfile = value;
    notifyListeners();
  }

  Future<bool> checkValidateUserPass(BuildContext context) async {
    try {
      String? token = await _singleton.getTokenApi();
      String? fcmToken = await _singleton.getFcmToken();
      int? userId = await _singleton.getUserId();
      if (emptyToNull(token) != null && userId != null && fcmToken != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfile?> getUserProfile() async {
    try {
      int? userId = await _singleton.getUserId();
      final response = await _userProfileRepo.getUserProfile(userId: userId);
      userProfile = response?.data?.userData;
      return response?.data?.userData;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUserProfile({required int? userId}) async {
    try {
      await _singleton.clearAll();
      userProfile = null;
      // await AppFirebase.deleteToken();
    } catch (e) {
      rethrow;
    }
  }
}
