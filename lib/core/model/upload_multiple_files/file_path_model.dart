import 'package:json_annotation/json_annotation.dart';
part 'file_path_model.g.dart';

@JsonSerializable()
class FilePathModel {
  String? filename;
  String? filePath;
  String? fileNetwork;
  bool linkURL;

  FilePathModel({
    this.filename,
    this.filePath,
    this.fileNetwork,
    this.linkURL = false,
  });

  factory FilePathModel.fromJson(Map<String, dynamic> json) =>
      _$FilePathModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilePathModelToJson(this);
}
