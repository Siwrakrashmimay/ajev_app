// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileData _$UserProfileDataFromJson(Map<String, dynamic> json) =>
    UserProfileData(
      data: json['data'] == null
          ? null
          : UserProfileUserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileDataToJson(UserProfileData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
