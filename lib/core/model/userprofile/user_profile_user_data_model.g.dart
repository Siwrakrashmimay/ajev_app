// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileUserData _$UserProfileUserDataFromJson(Map<String, dynamic> json) =>
    UserProfileUserData(
      userData: json['user'] == null
          ? null
          : UserProfile.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$UserProfileUserDataToJson(
        UserProfileUserData instance) =>
    <String, dynamic>{
      'user': instance.userData,
      'accessToken': instance.accessToken,
    };
