import 'package:ajev_application/core/init/navigation/navigation_constans.dart';
import 'package:ajev_application/core/init/navigation/route_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/base/base_screen.dart';
import '../../../../../core/init/constants/image/image_constants.dart';
import '../../../../../core/widgets/template_screen.dart';
import '../view-model/distance_view_view.dart';

class DistanceScreenView extends StatelessWidget {
  const DistanceScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {
        viewmodel.initializeData();
      },
      viewmodel: DistanceViewModel(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          titleText: 'เช็คระยะ',
          showBackButton: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: _buildMainBody(context, viewmodel),
          ),
        );
      },
    );
  }

  Widget _buildMainBody(BuildContext context, DistanceViewModel viewModel) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOwnerInfo(context, viewModel),
            _buildVehicleInfo(viewModel),
            const Divider(height: 32, thickness: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildOwnerInfo(BuildContext context, DistanceViewModel viewModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('ชื่อ-นามสกุล', viewModel.ownerName),
              const SizedBox(height: 8),
              _buildInfoRow('เบอร์โทร', viewModel.phoneNumber),
              const SizedBox(height: 8),
              _buildInfoRow('วันเข้ารับบริการ', '24/10/2567'),
              const SizedBox(height: 8),
              _buildInfoRow('รอบเช็คระยะ', '1,000 กม.'),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              viewModel.ownerName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              viewModel.phoneNumber,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '24/10/2567',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                AppNav.toNamed(
                  context,
                  AppNavConstants.DISTANCE_VIEW_DETAIL,
                  arguments: {
                    'ownerName': viewModel.ownerName,
                    'phoneNumber': viewModel.phoneNumber,
                    'serviceDate': '24/10/2567',
                    'checkDistance': '1,000 กม.',
                    'vehicleModel': 'GODDESS',
                    'vehicleColor': 'STEEL GREY',
                    'vehicleVin': 'AJ2G2500S2P00999',
                  },
                );
              },
              child: const Text(
                'รายละเอียด >>',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVehicleInfo(DistanceViewModel viewModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          ImageConstants.instance.goddessimg00,
          width: 120,
          height: 100,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'GODDESS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildInfoRowBike('สี', 'STEEL GREY'),
              const SizedBox(height: 8),
              _buildInfoRowBike('เลขตัวถัง', 'AJ2G2500S2P00999'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label : ',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRowBike(String label, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label : ',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          TextSpan(
            text: '$value ',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
