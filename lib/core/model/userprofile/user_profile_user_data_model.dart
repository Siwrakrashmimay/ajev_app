import 'package:json_annotation/json_annotation.dart';

import 'user_profile_model.dart';

part 'user_profile_user_data_model.g.dart';

@JsonSerializable()
class UserProfileUserData {
  @JsonKey(name: 'user')
  UserProfile? userData;

  @JsonKey(name: 'accessToken')
  String? accessToken;

  UserProfileUserData({
    this.userData,
    this.accessToken,
  });

  factory UserProfileUserData.fromJson(Map<String, dynamic> json) =>
      _$UserProfileUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileUserDataToJson(this);
}
