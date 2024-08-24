// ignore_for_file: non_constant_identifier_names

//flutter pub run build_runner build --delete-conflicting-outputs
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserData {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'email', defaultValue: '')
  String? email;

  @JsonKey(name: 'password', defaultValue: '')
  String? password;

  @JsonKey(name: 'birthday')
  String? birthday;

  @JsonKey(name: 'user_type')
  String? user_type;

  @JsonKey(name: 'firstname')
  String? firstname;

  @JsonKey(name: 'lastname')
  String? lastname;

  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'tel')
  String? tel;

  @JsonKey(name: 'gender')
  String? gender;

  @JsonKey(name: 'activeFlag')
  bool? activeFlag;

  @JsonKey(name: 'filename', defaultValue: '')
  String? filename;

  @JsonKey(name: 'filepath', defaultValue: '')
  String? filepath;

  @JsonKey(name: 'user_status')
  String? user_status;

  @JsonKey(name: 'createdAt')
  DateTime? createdAt;

  @JsonKey(name: 'updatedAt')
  DateTime? updatedAt;

  @JsonKey(name: 'houseDetailId')
  int? houseDetailId;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'house_detail')
  HouseDetail? house_detail;

  @JsonKey(name: 'village')
  Village? village;

  @JsonKey(name: 'villageId')
  int? villageId;
  UserData({
    this.id,
    this.email,
    this.password,
    this.birthday,
    this.user_type,
    this.villageId,
    this.firstname,
    this.lastname,
    this.mobile,
    this.tel,
    this.gender,
    this.activeFlag,
    this.user_status,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.houseDetailId,
    this.house_detail,
    this.filename,
    this.filepath,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class HouseDetail {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'house_name')
  String? houseName;

  @JsonKey(name: 'widthData')
  double? widthData;

  @JsonKey(name: 'hightData')
  double? hightData;

  @JsonKey(name: 'xData')
  double? xData;

  @JsonKey(name: 'yData')
  double? yData;

  @JsonKey(name: 'firstname')
  String? fistname;

  @JsonKey(name: 'lastname')
  String? lastname;

  @JsonKey(name: 'phonenumber')
  String? phonenumber;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'createdAt')
  String? createdAt;

  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  @JsonKey(name: 'village')
  Village? village;

  @JsonKey(name: 'villageId')
  int? villageId;

  HouseDetail({
    this.id,
    this.houseName,
    this.widthData,
    this.hightData,
    this.xData,
    this.yData,
    this.fistname,
    this.lastname,
    this.phonenumber,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.village,
  });

  factory HouseDetail.fromJson(Map<String, dynamic> json) =>
      _$HouseDetailFromJson(json);

  Map<String, dynamic> toJson() => _$HouseDetailToJson(this);
}

@JsonSerializable()
class Village {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'villageName')
  String? villageName;

  @JsonKey(name: 'villageNo')
  String? villageNo;

  @JsonKey(name: 'villageType')
  String? villageType;

  @JsonKey(name: 'villageAddress')
  String? villageAddress;

  @JsonKey(name: 'villageRoad')
  String? villageRoad;

  @JsonKey(name: 'villageZone')
  String? villageZone;

  @JsonKey(name: 'villageArea')
  String? villageArea;

  @JsonKey(name: 'villageCity')
  String? villageCity;

  @JsonKey(name: 'villageZipCode')
  String? villageZipCode;

  @JsonKey(name: 'villageStatus')
  bool? villageStatus;

  @JsonKey(name: 'createdAt')
  String? createdAt;

  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  Village({
    this.id,
    this.villageName,
    this.villageNo,
    this.villageType,
    this.villageAddress,
    this.villageRoad,
    this.villageZone,
    this.villageArea,
    this.villageCity,
    this.villageZipCode,
    this.villageStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory Village.fromJson(Map<String, dynamic> json) =>
      _$VillageFromJson(json);

  Map<String, dynamic> toJson() => _$VillageToJson(this);
}

@JsonSerializable()
class UserModelList {
  @JsonKey(name: 'response_status')
  String? responseStatus;

  @JsonKey(name: 'data')
  List<UserData>? data;

  UserModelList({this.responseStatus, this.data});

  factory UserModelList.fromJson(Map<String, dynamic> json) =>
      _$UserModelListFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelListToJson(this);
}
