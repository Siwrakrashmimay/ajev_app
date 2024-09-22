// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigVersion _$ConfigVersionFromJson(Map<String, dynamic> json) =>
    ConfigVersion(
      id: (json['id'] as num?)?.toInt(),
      key: json['key'] as String?,
      currentVersion: json['currentVersion'] as String?,
      minVersion: json['minVersion'] as String?,
    );

Map<String, dynamic> _$ConfigVersionToJson(ConfigVersion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'currentVersion': instance.currentVersion,
      'minVersion': instance.minVersion,
    };
