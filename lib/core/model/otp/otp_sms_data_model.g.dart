// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_sms_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpData _$OtpDataFromJson(Map<String, dynamic> json) => OtpData(
      code: json['code'] as String?,
      detail: json['detail'] as String?,
      result: json['result'] == null
          ? null
          : OtpResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtpDataToJson(OtpData instance) => <String, dynamic>{
      'code': instance.code,
      'detail': instance.detail,
      'result': instance.result,
    };
