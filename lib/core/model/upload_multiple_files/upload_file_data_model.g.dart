// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileData _$UploadFileDataFromJson(Map<String, dynamic> json) =>
    UploadFileData(
      data: json['data'] == null
          ? null
          : UploadFile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadFileDataToJson(UploadFileData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
