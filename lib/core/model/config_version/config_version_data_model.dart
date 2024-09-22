import 'package:json_annotation/json_annotation.dart';

import 'config_version_model.dart';
part 'config_version_data_model.g.dart';

@JsonSerializable()
class ConfigVersionData {
  @JsonKey(name: 'data')
  ConfigVersion? data;

  ConfigVersionData({
    this.data,
  });

  factory ConfigVersionData.fromJson(Map<String, dynamic> json) =>
      _$ConfigVersionDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigVersionDataToJson(this);
}
