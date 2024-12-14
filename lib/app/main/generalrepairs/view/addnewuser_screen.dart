// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../../core/base/base_screen.dart';
import '../../../../core/init/constants/image/image_constants.dart';
// import '../../../../core/init/navigation/navigation.dart';
import '../../../../core/widgets/template_screen.dart';
import '../../addnewuser/view-model/addnewuser_view.dart';

class GeneralrepirsScreen extends StatelessWidget {
  const GeneralrepirsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: AddNewUserView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          titleText: 'การตรวจสภาพรถ ซ่อมทั่วไป',
          showBackButton: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: _buildMainBody(context),
          ),
        );
      },
    );
  }

  Widget _buildMainBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text('ข้อมูลเจ้าของรถ', style: TextStyle(fontSize: 20)),
        ),
        _buildTextField(context, 'ชื่อ-นามสกุล', width: 350, height: 60),
        const SizedBox(height: 10),
        _buildTextField(context, 'เบอร์โทรศัพท์', width: 350, height: 60),
        const SizedBox(height: 10),
        _buildTextField(context, 'อีเมล', width: 350, height: 50),
        const SizedBox(height: 10),
        _buildDropdownField(context, 'รุ่นรถ'),
        const SizedBox(height: 10),
        _buildDropdownField(context, 'สี'),
        const SizedBox(height: 10),
        _buildTextField(context, 'ทะเบียนรถ', width: 350, height: 60),
        const SizedBox(height: 10),
        _buildTextField(context, 'เลขไมล์', width: 350, height: 50),
        const SizedBox(height: 10),
        _buildTextFieldWithIcon(
          context,
          'เลขตัวถัง',
          'Vin Number',
          Icons.qr_code_scanner,
          width: 350,
          height: 50,
          onIconTap: () {
            print('QR Code scanner icon tapped');
          },
        ),
        const SizedBox(height: 10),
        _buildTextField(context, 'เลขมอเตอร์', width: 350, height: 50),
        const SizedBox(height: 10),
        _buildTextField(context, 'เลขแบตเตอรี่', width: 350, height: 50),
        const SizedBox(height: 10),
        _buildDropdownField(context, 'รอบเช็คระยะ'),
        const SizedBox(height: 20),
        _buildTextArea(context, 'รายการเสียหาย / รายละเอียดเพิ่มเติม'),
        const SizedBox(height: 20),
        _buildVehicleImages(context),
        const SizedBox(height: 20),
        _buildConfirmButton(context),
      ],
    );
  }

  Widget _buildTextField(BuildContext context, String label,
      {double width = 300, double height = 50}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextFieldWithIcon(
    BuildContext context,
    String label,
    String hint,
    IconData iconData, {
    required double width,
    required double height,
    required VoidCallback onIconTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label   $hint', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              suffixIcon: IconButton(
                icon: Icon(iconData),
                onPressed: onIconTap,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(BuildContext context, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        SizedBox(
          width: 350,
          height: 50,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            items: <String>['Option 1', 'Option 2', 'Option 3']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {},
          ),
        ),
      ],
    );
  }

  Widget _buildTextArea(BuildContext context, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        SizedBox(
          width: 350,
          height: 100,
          child: TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVehicleImages(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstants.instance.goddessimg00,
            width: 300,
            height: 200,
          ),
          const Text('ด้านซ้าย', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 10),
          Image.asset(
            ImageConstants.instance.goddessimg00,
            width: 300,
            height: 200,
          ),
          const Text('ด้านขวา', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Text(
            'ยืนยัน',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
