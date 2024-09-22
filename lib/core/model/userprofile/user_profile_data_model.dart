import 'package:json_annotation/json_annotation.dart';

import 'user_profile_user_data_model.dart';

part 'user_profile_data_model.g.dart';

@JsonSerializable()
class UserProfileData {
  @JsonKey(name: 'data')
  UserProfileUserData? data;

  UserProfileData({
    this.data,
  });

  factory UserProfileData.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDataToJson(this);
}
