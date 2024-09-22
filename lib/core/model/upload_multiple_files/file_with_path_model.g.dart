// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_with_path_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileWithPathModel _$FileWithPathModelFromJson(Map<String, dynamic> json) =>
    FileWithPathModel(
      mainPath: json['mainPath'] as String,
      subPath: json['subPath'] as String,
      folderName: json['folderName'] as String,
      filePath: json['filePath'] == null
          ? null
          : FilePathModel.fromJson(json['filePath'] as Map<String, dynamic>),
      fileNetwork: json['fileNetwork'] == null
          ? null
          : FilePathModel.fromJson(json['fileNetwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileWithPathModelToJson(FileWithPathModel instance) =>
    <String, dynamic>{
      'mainPath': instance.mainPath,
      'subPath': instance.subPath,
      'folderName': instance.folderName,
      'filePath': instance.filePath,
      'fileNetwork': instance.fileNetwork,
    };
