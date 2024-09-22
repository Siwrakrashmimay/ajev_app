import 'package:json_annotation/json_annotation.dart';

import 'upload_file_model.dart';
part 'upload_file_data_model.g.dart';

@JsonSerializable()
class UploadFileData {
  @JsonKey(name: 'data')
  UploadFile? data;

  UploadFileData({
    this.data,
  });

  factory UploadFileData.fromJson(Map<String, dynamic> json) =>
      _$UploadFileDataFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileDataToJson(this);
}
