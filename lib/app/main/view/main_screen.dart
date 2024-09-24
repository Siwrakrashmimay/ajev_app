import 'package:ajev_application/app/main/view-model/main_view.dart';
import 'package:ajev_application/core/base/base_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/widgets/app_navbar.dart';
import '../../../core/widgets/template_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        onInit: (viewmodel) {},
        viewmodel: MainView(context: context),
        builder: (context, viewmodel, child, deviceScreen) {
          return BuildTemplateMain(
              nameWidgetAppBar: 'หน้าหลัก',
              imageBackground: ImageConstants.instance.backgrouniconAJ,
              paddingScreen: EdgeInsets.zero,
              showAppbar: true,
              bottomNavigationBar: const CustomNavigationBar(),
              child: const Center(
                child: Text('Main Screen'),
              ));
        });
  }
}
