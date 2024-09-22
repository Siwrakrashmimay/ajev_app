// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_sms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpMoldel _$OtpMoldelFromJson(Map<String, dynamic> json) => OtpMoldel(
      responseStatus: json['response_status'] as String?,
      message: json['message'] as String? ?? '',
    )..data = json['data'] == null
        ? null
        : OtpData.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$OtpMoldelToJson(OtpMoldel instance) => <String, dynamic>{
      'response_status': instance.responseStatus,
      'message': instance.message,
      'data': instance.data,
    };
