import 'package:ajev_application/core/base/base_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/init/navigation/navigation.dart';
import '../../../core/widgets/template_screen.dart';
import '../view-model/service_view.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        onInit: (viewmodel) {},
        viewmodel: ServiceView(context: context),
        builder: (context, viewmodel, child, deviceScreen) {
          return BuildTemplateMain(
              nameWidgetAppBar: 'การรับบริการ',
              imageBackground: ImageConstants.instance.backgrouniconAJ,
              paddingScreen: EdgeInsets.zero,
              showAppbar: true,
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
          ImageConstants.instance.group481,
          width: 200,
          height: 150,
        ),
        const SizedBox(height: 10),
        _buildButton(
            context, 'คิวนัดหมายเข้ารับบริการ', Colors.white, () {}, 250, 75),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'ตรวจเช็คตารงคิวการเข้ารับบริการของลูกค้า',
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
          ImageConstants.instance.group49,
          width: 200,
          height: 150,
        ),
        const SizedBox(height: 10),
        _buildButton(context, 'เบิกอะไหล่', Colors.white, () {
          AppNav.toNamed(context, AppNavConstants.SERVICE_PART);
        }, 250, 75),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'เช็คราคา และ สถานะการเบิกอะไหล่',
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
