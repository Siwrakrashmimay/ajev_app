import 'package:flutter/material.dart';
import 'package:ajev_application/core/base/base_screen.dart';
import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/widgets/template_screen.dart';
import '../view_model/manual_view.dart';

class ManualScreen extends StatelessWidget {
  const ManualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: ManualView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          showBackButton: true,
          titleText: 'เลือกรุ่นรถ AJ EV',
          nameWidgetAppBar: 'ข่าวสาร',
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          child: _buildNewsList(viewmodel),
        );
      },
    );
  }

  Widget _buildNewsList(ManualView viewmodel) {
    return PageView.builder(
      itemCount: viewmodel.bikeList.length,
      itemBuilder: (context, index) {
        final bike = viewmodel.bikeList[index];
        return GestureDetector(
          onTap: () {
            viewmodel.showInDevelopmentDialog(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                bike.imagePath,
                height: 400,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                bike.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

  // Widget _buildNewsItem(ManualView news) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         news.title,
  //         style: const TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       const SizedBox(height: 10),
  //       ClipRRect(
  //         borderRadius: BorderRadius.circular(10.0),
  //         child: Image.asset(news.imagePath, fit: BoxFit.cover),
  //       ),
  //       const SizedBox(height: 10),
  //       Text(
  //         news.description,
  //         style: const TextStyle(fontSize: 16, color: Colors.grey),
  //       ),
  //       const Divider(height: 40),
  //     ],
  //   );
  // }

