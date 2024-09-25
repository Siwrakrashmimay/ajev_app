// ignore_for_file: avoid_print

import 'package:ajev_application/core/init/navigation/navigation.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/init/constants/image/image_constants.dart';
import '../../../../core/widgets/template_screen.dart';
import '../view_model/bike_view.dart';

class BikeScreen extends StatelessWidget {
  const BikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: BikeView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          nameWidgetAppBar: 'ข้อมูลลูกค้า',
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'ค้นหาข้อมูลลูกค้า',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildSearchField(context),
        const SizedBox(height: 20),
        _buildSearchButton(context),
        const SizedBox(height: 20),
        _buildSearchExample(context),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'ค้นหาข้อมูลลูกค้า',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              print('เปิดกล้องสแกน QR Code');
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            AppNav.toNamed(context, AppNavConstants.BIKE_DETAIL);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: const Text(
            'ค้นหา',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchExample(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        'ตัวอย่างการกรอกข้อมูลค้นหา\n\n• ชื่อ-นามสกุล\n• เบอร์โทร\n• เลขทะเบียน\n• เลขตัวถัง\n• เลขมอเตอร์\n• เลขแบตเตอรี่',
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
