import 'package:json_annotation/json_annotation.dart';

import 'otp_sms_data_model.dart';
part 'otp_sms_model.g.dart';

@JsonSerializable()
class OtpMoldel {
  @JsonKey(name: 'response_status')
  String? responseStatus;

  @JsonKey(name: 'message', defaultValue: '')
  String? message;

  @JsonKey(name: 'data')
  OtpData? data;

  OtpMoldel({this.responseStatus, this.message});

  factory OtpMoldel.fromJson(Map<String, dynamic> json) =>
      _$OtpMoldelFromJson(json);

  Map<String, dynamic> toJson() => _$OtpMoldelToJson(this);
}
