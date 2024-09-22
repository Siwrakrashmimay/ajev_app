import 'package:json_annotation/json_annotation.dart';
part 'upload_file_model.g.dart';

@JsonSerializable()
class UploadFile {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'filename', defaultValue: '')
  String? filename;

  @JsonKey(name: 'path', defaultValue: '')
  String? path;

  @JsonKey(name: 'type', defaultValue: '')
  String? type;

  @JsonKey(name: 'mainPath', defaultValue: '')
  String? mainPath;

  UploadFile({
    this.id,
    this.filename,
    this.path,
    this.type,
    this.mainPath,
  });

  factory UploadFile.fromJson(Map<String, dynamic> json) =>
      _$UploadFileFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileToJson(this);
}
