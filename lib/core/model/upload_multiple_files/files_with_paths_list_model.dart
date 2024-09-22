import 'package:json_annotation/json_annotation.dart';

import 'file_path_model.dart';
part 'files_with_paths_list_model.g.dart';

@JsonSerializable()
class FilesWithPathsListModel {
  String mainPath;
  String subPath;
  String folderName;
  List<FilePathModel> filePathList;
  List<FilePathModel> fileLinkList = [];

  FilesWithPathsListModel({
    required this.mainPath,
    required this.subPath,
    required this.folderName,
    required this.filePathList,
    this.fileLinkList = const [],
  });

  factory FilesWithPathsListModel.fromJson(Map<String, dynamic> json) =>
      _$FilesWithPathsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilesWithPathsListModelToJson(this);
}
