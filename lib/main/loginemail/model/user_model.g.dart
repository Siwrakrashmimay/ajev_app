// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      birthday: json['birthday'] as String?,
      user_type: json['user_type'] as String?,
      villageId: (json['villageId'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      mobile: json['mobile'] as String?,
      tel: json['tel'] as String?,
      gender: json['gender'] as String?,
      activeFlag: json['activeFlag'] as bool?,
      user_status: json['user_status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      token: json['token'] as String?,
      houseDetailId: (json['houseDetailId'] as num?)?.toInt(),
      house_detail: json['house_detail'] == null
          ? null
          : HouseDetail.fromJson(json['house_detail'] as Map<String, dynamic>),
      filename: json['filename'] as String? ?? '',
      filepath: json['filepath'] as String? ?? '',
    )..village = json['village'] == null
        ? null
        : Village.fromJson(json['village'] as Map<String, dynamic>);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'birthday': instance.birthday,
      'user_type': instance.user_type,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'mobile': instance.mobile,
      'tel': instance.tel,
      'gender': instance.gender,
      'activeFlag': instance.activeFlag,
      'filename': instance.filename,
      'filepath': instance.filepath,
      'user_status': instance.user_status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'houseDetailId': instance.houseDetailId,
      'token': instance.token,
      'house_detail': instance.house_detail,
      'village': instance.village,
      'villageId': instance.villageId,
    };

HouseDetail _$HouseDetailFromJson(Map<String, dynamic> json) => HouseDetail(
      id: (json['id'] as num?)?.toInt(),
      houseName: json['house_name'] as String?,
      widthData: (json['widthData'] as num?)?.toDouble(),
      hightData: (json['hightData'] as num?)?.toDouble(),
      xData: (json['xData'] as num?)?.toDouble(),
      yData: (json['yData'] as num?)?.toDouble(),
      fistname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      phonenumber: json['phonenumber'] as String?,
      address: json['address'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      village: json['village'] == null
          ? null
          : Village.fromJson(json['village'] as Map<String, dynamic>),
    )..villageId = (json['villageId'] as num?)?.toInt();

Map<String, dynamic> _$HouseDetailToJson(HouseDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'house_name': instance.houseName,
      'widthData': instance.widthData,
      'hightData': instance.hightData,
      'xData': instance.xData,
      'yData': instance.yData,
      'firstname': instance.fistname,
      'lastname': instance.lastname,
      'phonenumber': instance.phonenumber,
      'address': instance.address,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'village': instance.village,
      'villageId': instance.villageId,
    };

Village _$VillageFromJson(Map<String, dynamic> json) => Village(
      id: (json['id'] as num?)?.toInt(),
      villageName: json['villageName'] as String?,
      villageNo: json['villageNo'] as String?,
      villageType: json['villageType'] as String?,
      villageAddress: json['villageAddress'] as String?,
      villageRoad: json['villageRoad'] as String?,
      villageZone: json['villageZone'] as String?,
      villageArea: json['villageArea'] as String?,
      villageCity: json['villageCity'] as String?,
      villageZipCode: json['villageZipCode'] as String?,
      villageStatus: json['villageStatus'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$VillageToJson(Village instance) => <String, dynamic>{
      'id': instance.id,
      'villageName': instance.villageName,
      'villageNo': instance.villageNo,
      'villageType': instance.villageType,
      'villageAddress': instance.villageAddress,
      'villageRoad': instance.villageRoad,
      'villageZone': instance.villageZone,
      'villageArea': instance.villageArea,
      'villageCity': instance.villageCity,
      'villageZipCode': instance.villageZipCode,
      'villageStatus': instance.villageStatus,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

UserModelList _$UserModelListFromJson(Map<String, dynamic> json) =>
    UserModelList(
      responseStatus: json['response_status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelListToJson(UserModelList instance) =>
    <String, dynamic>{
      'response_status': instance.responseStatus,
      'data': instance.data,
    };
