import 'package:flutter/material.dart';
import '../../../../../core/base/base_screen.dart';
import '../../../../../core/init/constants/image/image_constants.dart';
import '../../../../../core/widgets/template_screen.dart';
import '../view_model/service_battary_view.dart';

class ServiceBattaryScreen extends StatelessWidget {
  const ServiceBattaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: ServiceBattaryView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          child: _buildBatteryList(viewmodel),
        );
      },
    );
  }

  Widget _buildBatteryList(ServiceBattaryView viewmodel) {
    return ListView.builder(
      itemCount: viewmodel.batteries.length,
      itemBuilder: (context, index) {
        final battery = viewmodel.batteries[index];
        return _buildBatteryItem(battery);
      },
    );
  }

  Widget _buildBatteryItem(BatteryModel battery) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  battery.name,
                  style: const TextStyle(
                    fontSize: 22,
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
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(battery.imagePath, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
