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
          titleText: 'รุ่นแบตเตอรี่',
          showBackButton: true,
          child: _buildBatteryList(viewmodel),
        );
      },
    );
  }

  Widget _buildBatteryList(ServiceBattaryView viewmodel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        itemCount: viewmodel.batteries.length,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.0),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            height: 15,
          ),
        ),
        itemBuilder: (context, index) {
          final battery = viewmodel.batteries[index];
          return _buildBatteryItem(battery);
        },
      ),
    );
  }

  Widget _buildBatteryItem(BatteryModel battery) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
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
          const SizedBox(width: 16), // เพิ่มระยะห่างระหว่าง Text และ Image
          Expanded(
            flex: 1, // Flex สำหรับ Image
            child: SizedBox(
              height: 100,
              child: Image.asset(battery.imagePath, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
