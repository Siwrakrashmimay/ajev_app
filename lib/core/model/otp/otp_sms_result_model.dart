import 'package:json_annotation/json_annotation.dart';
part 'otp_sms_result_model.g.dart';

@JsonSerializable()
class OtpResult {
  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'ref_code', defaultValue: '')
  String? refCode;

  @JsonKey(name: 'phonenumber', defaultValue: '')
  String? phoneNumber;

  OtpResult({this.token, this.refCode, this.phoneNumber});

  factory OtpResult.fromJson(Map<String, dynamic> json) =>
      _$OtpResultFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResultToJson(this);
}
