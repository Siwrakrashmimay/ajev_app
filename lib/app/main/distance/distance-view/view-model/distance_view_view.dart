// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/base/base_viewmodel.dart';
import '../../../../../provider/user_profile_provider.dart';

class DistanceViewModel extends BaseViewModel {
  // User profile provider
  final UserProfileProvider? _userProfileProvider;

  // Example fields
  String ownerName = '';
  String phoneNumber = '';
  String email = '';
  String selectedCarModel = '';
  String selectedColor = '';
  String carRegistration = '';
  String vinNumber = '';
  String mileage = '';

  DistanceViewModel({required BuildContext context})
      : _userProfileProvider = context.read<UserProfileProvider>() {
    initializeData();
  }

  void initializeData() {
    ownerName = 'ธนวัฒน์ ทองกัน';
    phoneNumber = '098 834 6647';
    email = 'tanawat@example.com';
    selectedCarModel = 'GODDESS';
    selectedColor = 'STEEL GREY';
    carRegistration = '1กข-1234';
    vinNumber = 'AJ2G2500S2P00999';
    mileage = '1,000 กม.';
    notifyListeners();
  }

  void resetFormData() {
    ownerName = '';
    phoneNumber = '';
    email = '';
    selectedCarModel = '';
    selectedColor = '';
    carRegistration = '';
    vinNumber = '';
    mileage = '';
    notifyListeners();
  }
}
