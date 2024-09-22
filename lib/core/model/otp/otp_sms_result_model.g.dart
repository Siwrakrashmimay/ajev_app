// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_sms_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpResult _$OtpResultFromJson(Map<String, dynamic> json) => OtpResult(
      token: json['token'] as String?,
      refCode: json['ref_code'] as String? ?? '',
      phoneNumber: json['phonenumber'] as String? ?? '',
    );

Map<String, dynamic> _$OtpResultToJson(OtpResult instance) => <String, dynamic>{
      'token': instance.token,
      'ref_code': instance.refCode,
      'phonenumber': instance.phoneNumber,
    };
