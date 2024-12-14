import 'package:flutter/material.dart';

import '../../config/config.dart';
import 'template_screen.dart';

class NotFoundNavigationWidget extends StatelessWidget {
  const NotFoundNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildTemplateMain(
      titleText: '',
      showBackButton: false,
      child: Scaffold(
        body: Center(
            child: Text(
          'Not Found Screen',
          style: AppTextStyle(context).kText16Red,
        )),
      ),
    );
  }
}
