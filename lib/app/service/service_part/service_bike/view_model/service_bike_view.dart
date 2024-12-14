// ignore_for_file: unused_field

import 'package:ajev_application/core/base/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/init/constants/image/image_constants.dart';
import '../../../../../provider/user_profile_provider.dart';

class ServiceBikeView extends BaseViewModel {
  final UserProfileProvider? _userProfileProvider;
  ServiceBikeView({required BuildContext context})
      : _userProfileProvider = context.read<UserProfileProvider>();

  List<BikeModel> bikes = [
    BikeModel(
        id: 1, name: 'NCV', imagePath: ImageConstants.instance.beatsimag00),
    BikeModel(
        id: 2, name: 'GODDESS', imagePath: ImageConstants.instance.fliximg00),
    BikeModel(
        id: 3, name: 'TAURUS', imagePath: ImageConstants.instance.iaming00),
    BikeModel(
        id: 4, name: 'FLIX', imagePath: ImageConstants.instance.goddessimg00),
    BikeModel(id: 5, name: 'I AM', imagePath: ImageConstants.instance.ncvimg00),
    BikeModel(
        id: 6, name: 'BEATS', imagePath: ImageConstants.instance.taurusimg00),
  ];
}

class BikeModel {
  final int id;
  final String name;
  final String imagePath;

  BikeModel({
    required this.id,
    required this.name,
    required this.imagePath,
  });
}
