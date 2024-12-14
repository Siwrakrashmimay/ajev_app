import 'package:flutter/material.dart';

import '../../../../../../core/base/base_viewmodel.dart';

class DistanceViewDetailViewModel extends BaseViewModel {
  String ownerName = '';
  String phoneNumber = '';
  String serviceDate = '';
  String checkDistance = '';
  String vehicleModel = '';
  String vehicleColor = '';
  String vehicleVin = '';

  DistanceViewDetailViewModel({required BuildContext context}) {
    initializeData(context);
  }

  void initializeData(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments != null) {
      ownerName = arguments['ownerName'] ?? '';
      phoneNumber = arguments['phoneNumber'] ?? '';
      serviceDate = arguments['serviceDate'] ?? '';
      checkDistance = arguments['checkDistance'] ?? '';
      vehicleModel = arguments['vehicleModel'] ?? '';
      vehicleColor = arguments['vehicleColor'] ?? '';
      vehicleVin = arguments['vehicleVin'] ?? '';
    }

    notifyListeners(); // Notify UI about the data initialization
  }

  void updateDetails(String updatedDetails) {
    // Example method to update additional details
    print('Updated Details: $updatedDetails');
  }
}
