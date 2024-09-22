// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_path_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilePathModel _$FilePathModelFromJson(Map<String, dynamic> json) =>
    FilePathModel(
      filename: json['filename'] as String?,
      filePath: json['filePath'] as String?,
      fileNetwork: json['fileNetwork'] as String?,
      linkURL: json['linkURL'] as bool? ?? false,
    );

Map<String, dynamic> _$FilePathModelToJson(FilePathModel instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'filePath': instance.filePath,
      'fileNetwork': instance.fileNetwork,
      'linkURL': instance.linkURL,
    };
