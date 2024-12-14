import 'package:ajev_application/core/init/navigation/navigation.dart';
// import 'package:ajev_application/core/init/navigation/route_manager.dart';
import 'package:flutter/material.dart';
import '../../../../../core/base/base_screen.dart';
import '../../../../../core/init/constants/image/image_constants.dart';
import '../../../../../core/widgets/template_screen.dart';
import '../view_model/service_bike_view.dart';

class ServiceBikeScreen extends StatelessWidget {
  const ServiceBikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: ServiceBikeView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          titleText: 'เลือกรุ่นรถ AJ EV',
          showBackButton: true,
          child: _buildBikeGrid(viewmodel),
        );
      },
    );
  }

  Widget _buildBikeGrid(ServiceBikeView viewmodel) {
    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 0.75,
      ),
      itemCount: viewmodel.bikes.length,
      itemBuilder: (context, index) {
        final bike = viewmodel.bikes[index];
        return _buildBikeItem(context, bike);
      },
    );
  }

  Widget _buildBikeItem(BuildContext context, BikeModel bike) {
    return GestureDetector(
      onTap: () {
        AppNav.toNamed(context, AppNavConstants.SERVICE_BIKE_PART_VIEW,
            arguments: {'bikeId': bike.id.toString()});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  bike.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              bike.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
