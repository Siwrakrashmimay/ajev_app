import 'package:json_annotation/json_annotation.dart';

import 'upload_file_model.dart';
part 'upload_file_data_list_model.g.dart';

@JsonSerializable()
class UploadFileDataList {
  @JsonKey(name: 'data', defaultValue: [])
  List<UploadFile>? data;

  UploadFileDataList({
    this.data,
  });

  factory UploadFileDataList.fromJson(Map<String, dynamic> json) =>
      _$UploadFileDataListFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileDataListToJson(this);
}
