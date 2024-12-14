import 'package:flutter/material.dart';

import '../../../../../../core/base/base_screen.dart';
import '../../../../../../core/init/constants/image/image_constants.dart';
import '../../../../../../core/widgets/template_screen.dart';
import '../view_model/service_bike_part_view.dart';

class ServiceBikePartScreen extends StatelessWidget {
  const ServiceBikePartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final arguments =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // final bikeId = arguments?['bikeId'];

    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: ServiceBikePartView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          titleText: 'ชิ้นส่วนอะไหล่รถ',
          showBackButton: true,
          child: _buildBatteryList(context, viewmodel),
        );
      },
    );
  }

  Widget _buildBatteryList(
      BuildContext context, ServiceBikePartView viewmodel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        itemCount: viewmodel.batteries.length,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.0),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            height: 10,
          ),
        ),
        itemBuilder: (context, index) {
          final battery = viewmodel.batteries[index];
          return _buildBatteryItem(context, battery);
        },
      ),
    );
  }

  Widget _buildBatteryItem(BuildContext context, BatteryModel battery) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 90,
              child: Image.asset(battery.imagePath, fit: BoxFit.contain),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.4),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  battery.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${battery.voltage} ${battery.capacity}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
