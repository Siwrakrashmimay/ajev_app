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
          nameWidgetAppBar: 'เบิกอะไหล่',
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          // showAppbar: true,
          showBackButton: false,
          titleText: 'เบิกอะไหล่',
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildGrid(context),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      children: [
        _buildServiceTile(
          icon: ImageConstants.instance.battryicon,
          label: 'แบตเตอรี่',
          width: 100,
          height: 120,
          onTap: () {
            AppNav.toNamed(context, AppNavConstants.SERVICE_BATTERY);
          },
        ),
        _buildServiceTile(
          icon: ImageConstants.instance.spareparticon,
          label: 'ชิ้นส่วนอะไหล่',
          width: 120,
          height: 120,
          onTap: () {
            AppNav.toNamed(context, AppNavConstants.SERVICE_BIKE);
          },
        ),
        _buildEmptyGridItem(),
        _buildEmptyGridItem(),
        _buildEmptyGridItem(),
        _buildEmptyGridItem(),
      ],
    );
  }

  // Widget _buildGridItem(
  //   BuildContext context, {
  //   required String iconPath,
  //   required String label,
  //   required VoidCallback onPressed,
  // }) {
  //   return GestureDetector(
  //     onTap: onPressed,
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: const Color(0xFF1A1A1A),
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Image.asset(
  //             iconPath,
  //             width: 50,
  //             height: 50,
  //             color: Colors.white,
  //           ),
  //           const SizedBox(height: 10),
  //           Text(
  //             label,
  //             style: const TextStyle(
  //               color: Colors.white,
  //               fontSize: 16,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildServiceTile({
    required String icon,
    required String label,
    required double width,
    required double height,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 35, 35, 35),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Image.asset(
                icon,
                // fit: BoxFit.contain,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyGridItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
