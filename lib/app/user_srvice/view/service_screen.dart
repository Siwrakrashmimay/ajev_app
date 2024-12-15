import 'package:ajev_application/app/user_srvice/view_model/service_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/template_screen.dart';
import '../../../core/init/constants/image/image_constants.dart';

class ServiceUserScreen extends StatelessWidget {
  const ServiceUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: ServiceUserView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          appBarThemeMode: AppBarThemeMode.dark,
          nameWidgetAppBar: 'บริการต่างๆ',
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          showBackButton: false,
          titleText: 'บริการต่างๆ',
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildGrid(),
          ),
        );
      },
    );
  }

  Widget _buildGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // ปิด Scroll ใน GridView
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildServiceCard(
          icon: Icons.settings,
          label: 'จองคิวบริการ',
          onTap: () {},
        ),
        _buildServiceCard(
          icon: Icons.timeline,
          label: 'ระยะการใช้งาน',
          onTap: () {},
        ),
        _buildServiceCard(
          icon: Icons.menu_book,
          label: 'คู่มือการใช้งาน',
          onTap: () {},
        ),
        _buildServiceCard(
          icon: Icons.ev_station,
          label: 'สถาบันชาร์จ',
          onTap: () {},
        ),
        _buildEmptyGridItem(),
        _buildEmptyGridItem(),
      ],
    );
  }

  Widget _buildEmptyGridItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.grey.shade400),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
