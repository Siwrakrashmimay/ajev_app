// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_with_paths_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilesWithPathsListModel _$FilesWithPathsListModelFromJson(
        Map<String, dynamic> json) =>
    FilesWithPathsListModel(
      mainPath: json['mainPath'] as String,
      subPath: json['subPath'] as String,
      folderName: json['folderName'] as String,
      filePathList: (json['filePathList'] as List<dynamic>)
          .map((e) => FilePathModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fileLinkList: (json['fileLinkList'] as List<dynamic>?)
              ?.map((e) => FilePathModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FilesWithPathsListModelToJson(
        FilesWithPathsListModel instance) =>
    <String, dynamic>{
      'mainPath': instance.mainPath,
      'subPath': instance.subPath,
      'folderName': instance.folderName,
      'filePathList': instance.filePathList,
      'fileLinkList': instance.fileLinkList,
    };
