import 'package:json_annotation/json_annotation.dart';

import 'file_path_model.dart';
part 'file_with_path_model.g.dart';

@JsonSerializable()
class FileWithPathModel {
  String mainPath;
  String subPath;
  String folderName;
  FilePathModel? filePath;
  FilePathModel? fileNetwork;

  FileWithPathModel({
    required this.mainPath,
    required this.subPath,
    required this.folderName,
    required this.filePath,
    this.fileNetwork,
  });

  factory FileWithPathModel.fromJson(Map<String, dynamic> json) =>
      _$FileWithPathModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileWithPathModelToJson(this);
}
