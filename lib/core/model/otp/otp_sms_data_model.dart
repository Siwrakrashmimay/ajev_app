import 'package:json_annotation/json_annotation.dart';

import 'otp_sms_result_model.dart';
part 'otp_sms_data_model.g.dart';

@JsonSerializable()
class OtpData {
  @JsonKey(name: 'code')
  String? code;

  @JsonKey(name: 'detail')
  String? detail;

  @JsonKey(name: 'result')
  OtpResult? result;

  OtpData({this.code, this.detail, this.result});

  factory OtpData.fromJson(Map<String, dynamic> json) =>
      _$OtpDataFromJson(json);

  Map<String, dynamic> toJson() => _$OtpDataToJson(this);
}
