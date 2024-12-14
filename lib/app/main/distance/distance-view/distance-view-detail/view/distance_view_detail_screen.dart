import 'package:flutter/material.dart';

import '../../../../../../core/base/base_screen.dart';
import '../../../../../../core/init/constants/image/image_constants.dart';
import '../../../../../../core/widgets/template_screen.dart';
import '../view_model/distance_view_detail_view.dart';

class DistanceViewDetailScreen extends StatelessWidget {
  const DistanceViewDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewModel) {
        viewModel.initializeData(context);
      },
      viewmodel: DistanceViewDetailViewModel(context: context),
      builder: (context, viewModel, child, deviceScreen) {
        return BuildTemplateMain(
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          titleText: 'รายละเอียด',
          showBackButton: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVehicleInfo(viewModel),
                const SizedBox(height: 16),
                // const Divider(height: 32, thickness: 1),
                _buildOwnerInfo(viewModel),
                const SizedBox(height: 16),
                _buildDamageDetailsField(viewModel),
                const SizedBox(height: 16),
                _buildEditButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildVehicleInfo(DistanceViewDetailViewModel viewModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          ImageConstants.instance.goddessimg00,
          width: 150,
          height: 120,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.vehicleModel,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'สี: ${viewModel.vehicleColor}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'เลขตัวถัง: ${viewModel.vehicleVin}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOwnerInfo(DistanceViewDetailViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow('ชื่อ-นามสกุล', viewModel.ownerName),
        const SizedBox(height: 8),
        _buildInfoRow('เบอร์โทร', viewModel.phoneNumber),
        const SizedBox(height: 8),
        _buildInfoRow('วันเข้ารับบริการ', viewModel.serviceDate),
        const SizedBox(height: 8),
        _buildInfoRow('รอบเช็คระยะ', viewModel.checkDistance),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildDamageDetailsField(DistanceViewDetailViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'รายการเสียหาย / รายละเอียดเพิ่มเติม',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: 5,
          onChanged: (value) => viewModel.updateDetails(value),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditButton() {
    return Center(
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.edit, color: Colors.blue),
        label: const Text(
          'แก้ไขข้อมูล',
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
      ),
    );
  }
}
