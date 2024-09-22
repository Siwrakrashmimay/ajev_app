import 'package:json_annotation/json_annotation.dart';
part 'config_version_model.g.dart';

@JsonSerializable()
class ConfigVersion {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'key')
  String? key;

  @JsonKey(name: 'currentVersion')
  String? currentVersion;

  @JsonKey(name: 'minVersion')
  String? minVersion;

  ConfigVersion({
    this.id,
    this.key,
    this.currentVersion,
    this.minVersion,
  });

  factory ConfigVersion.fromJson(Map<String, dynamic> json) =>
      _$ConfigVersionFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigVersionToJson(this);
}
