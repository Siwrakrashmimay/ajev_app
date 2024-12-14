// ignore_for_file: unused_field

import 'package:ajev_application/core/base/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/init/constants/image/image_constants.dart';
import '../../../../../../provider/user_profile_provider.dart';

class ServiceBikePartView extends BaseViewModel {
  final UserProfileProvider? _userProfileProvider;
  ServiceBikePartView({required BuildContext context})
      : _userProfileProvider = context.read<UserProfileProvider>();

  List<BatteryModel> batteries = [
    BatteryModel(
        name: 'Ampace',
        voltage: '74V',
        capacity: '28Ah',
        imagePath: ImageConstants.instance.batteryampace),
    BatteryModel(
        name: 'Phylion',
        voltage: '72V',
        capacity: '24Ah',
        imagePath: ImageConstants.instance.batteryphylion),
    BatteryModel(
        name: 'EQ Tech',
        voltage: '72V',
        capacity: '45Ah',
        imagePath: ImageConstants.instance.batteryphylion1),
  ];
}

class BatteryModel {
  final String name;
  final String voltage;
  final String capacity;
  final String imagePath;

  BatteryModel({
    required this.name,
    required this.voltage,
    required this.capacity,
    required this.imagePath,
  });
}
