// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_data_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileDataList _$UploadFileDataListFromJson(Map<String, dynamic> json) =>
    UploadFileDataList(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => UploadFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UploadFileDataListToJson(UploadFileDataList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
