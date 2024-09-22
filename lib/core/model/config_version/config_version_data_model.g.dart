// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_version_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigVersionData _$ConfigVersionDataFromJson(Map<String, dynamic> json) =>
    ConfigVersionData(
      data: json['data'] == null
          ? null
          : ConfigVersion.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigVersionDataToJson(ConfigVersionData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
