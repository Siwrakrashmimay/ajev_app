// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String? ?? '',
      username: json['user_name'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
    )
      ..code = json['code'] as String?
      ..role = json['role'] as String?
      ..gender = json['gender'] as String?
      ..bod = json['bod'] == null ? null : DateTime.parse(json['bod'] as String)
      ..tel = json['tel'] as String? ?? '';

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'email': instance.email,
      'role': instance.role,
      'gender': instance.gender,
      'user_name': instance.username,
      'full_name': instance.fullName,
      'bod': instance.bod?.toIso8601String(),
      'avatar': instance.avatar,
      'tel': instance.tel,
    };
