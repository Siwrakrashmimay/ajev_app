// ignore_for_file: unused_field

import 'package:ajev_application/core/base/base_viewmodel.dart';
import 'package:ajev_application/core/init/constants/image/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/user_profile_provider.dart';
// import '../../../core/init/constants/image/image_constants.dart';

class ManualView extends BaseViewModel {
  final UserProfileProvider? _userProfileProvider;
  ManualView({required BuildContext context})
      : _userProfileProvider = context.read<UserProfileProvider>();

  List<BikeModel> bikeList = [
    BikeModel(
      title: 'GODDESS',
      imagePath: ImageConstants.instance.goddessimg00,
    ),
    BikeModel(
      title: 'TAURUS',
      imagePath: ImageConstants.instance.taurusimg00,
    ),
  ];

  void showInDevelopmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'ขออภัยในความไม่สะดวก',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.amber.shade700,
                size: 50,
              ),
              const SizedBox(height: 10),
              const Text(
                'อยู่ในขั้นตอนการพัฒนา',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('ตกลง'),
              ),
            ),
          ],
        );
      },
    );
  }
}

class BikeModel {
  final String title;
  final String imagePath;

  BikeModel({required this.title, required this.imagePath});
}
