// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFile _$UploadFileFromJson(Map<String, dynamic> json) => UploadFile(
      id: (json['id'] as num?)?.toInt(),
      filename: json['filename'] as String? ?? '',
      path: json['path'] as String? ?? '',
      type: json['type'] as String? ?? '',
      mainPath: json['mainPath'] as String? ?? '',
    );

Map<String, dynamic> _$UploadFileToJson(UploadFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'path': instance.path,
      'type': instance.type,
      'mainPath': instance.mainPath,
    };
