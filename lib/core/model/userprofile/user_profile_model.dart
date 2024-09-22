import 'package:json_annotation/json_annotation.dart';
part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfile {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'code')
  String? code;

  @JsonKey(name: 'email', defaultValue: '')
  String? email;

  @JsonKey(name: 'role')
  String? role;

  @JsonKey(name: 'gender')
  String? gender;

  @JsonKey(name: 'user_name', defaultValue: '')
  String? username;

  @JsonKey(name: 'full_name', defaultValue: '')
  String? fullName;

  @JsonKey(name: 'bod')
  DateTime? bod;

  @JsonKey(name: 'avatar', defaultValue: '')
  String? avatar;

  @JsonKey(name: 'tel', defaultValue: '')
  String? tel;

  UserProfile({
    this.id,
    this.email,
    this.username,
    this.fullName,
    this.avatar,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
