import 'package:ajev_application/app/service/service_part/view-model/service_part_view.dart';
import 'package:ajev_application/core/base/base_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/constants/image/image_constants.dart';
import '../../../../core/init/navigation/navigation.dart';
import '../../../../core/widgets/app_navbar.dart';
import '../../../../core/widgets/template_screen.dart';

class ServicePartScreen extends StatelessWidget {
  const ServicePartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        onInit: (viewmodel) {},
        viewmodel: ServicePartView(context: context),
        builder: (context, viewmodel, child, deviceScreen) {
          return BuildTemplateMain(
              imageBackground: ImageConstants.instance.backgrouniconAJ,
              paddingScreen: EdgeInsets.zero,
              showAppbar: true,
              bottomNavigationBar: const CustomNavigationBar(),
              child: Center(child: _buildMainBody(context)));
        });
  }

  Widget _buildMainBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTopSection(context),
        const SizedBox(height: 30),
        _buildBottomSection(context),
      ],
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageConstants.instance.group50,
          width: 200,
          height: 150,
        ),
        const SizedBox(height: 10),
        _buildButton(context, 'แบตเตอรี่', Colors.white, () {
          AppNav.toNamed(context, AppNavConstants.ADD_NEW_USER);
        }, 250, 75),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'เช็คราคา และ แบตเตอรี่ ให้ถูกต้อง ก่อนทำการสั่งซื้อ',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageConstants.instance.group51,
          width: 200,
          height: 150,
        ),
        const SizedBox(height: 10),
        _buildButton(context, 'ชิ้นส่วนอะไหล่รภ', Colors.white, () {}, 250, 75),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'เช็คราคา และ ชื่ออะไหล่ ให้ถูกต้องก่อนทำการสั่งซื้อ',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String text, Color textColor,
      VoidCallback onPressed, double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide.none,
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
