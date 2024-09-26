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
    BikeModel(name: 'NCV', imagePath: ImageConstants.instance.beatsimag00),
    BikeModel(name: 'GODDESS', imagePath: ImageConstants.instance.fliximg00),
    BikeModel(name: 'TAURUS', imagePath: ImageConstants.instance.iaming00),
    BikeModel(name: 'FLIX', imagePath: ImageConstants.instance.goddessimg00),
    BikeModel(name: 'I AM', imagePath: ImageConstants.instance.ncvimg00),
    BikeModel(name: 'BEATS', imagePath: ImageConstants.instance.taurusimg00),
  ];
}

class BikeModel {
  final String name;
  final String imagePath;

  BikeModel({
    required this.name,
    required this.imagePath,
  });
}
