import 'package:flutter/material.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/widgets/template_screen.dart';
import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/init/navigation/navigation.dart';
import '../../../core/widgets/app_bar.dart';
import '../view_model/accuont_view.dart';

class AccuontUserScreen extends StatelessWidget {
  const AccuontUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: AccuontView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          appBarThemeMode: AppBarThemeMode.dark,
          nameWidgetAppBar: 'บัญชีของฉัน',
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          showBackButton: false,
          titleText: 'บัญชีของฉัน',
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                _buildProfileHeader(),
                const SizedBox(height: 20),
                _buildVehicleCard(),
                const SizedBox(height: 20),
                _buildAddVehicleCard(),
                const SizedBox(height: 40),
                _buildMainButton(context, 'การตั้งค่า'),
                const SizedBox(height: 20),
                _buildMainButton(context, 'ติดต่อ AJ EV'),
                const SizedBox(height: 20),
                _buildLogoutButton(context),
                const SizedBox(height: 20),
                const Text(
                  'App V.1.0.00',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade800,
          child: const Icon(Icons.person, size: 50, color: Colors.white),
        ),
        const SizedBox(width: 15),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thanawat Thongkan',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'หมายเลขสมาชิก : AJ2G250P0999',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVehicleCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
      decoration: _buildCardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImageConstants.instance.taurusimg00,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          const Text(
            'TAURUS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddVehicleCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
      decoration: _buildCardDecoration(),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.white, size: 20),
          SizedBox(width: 10),
          Text(
            'เพิ่มรถของท่าน',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainButton(BuildContext context, String label) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          if (label == 'ติดต่อ AJ EV') {
            AppNav.toNamed(context, AppNavConstants.ARK);
          }
        },
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          AppNav.toNameAndRemoveUntil(context, AppNavConstants.DEFALT);
        },
        child: const Text(
          'ออกจากระบบ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.white24),
      borderRadius: BorderRadius.circular(15),
      color: Colors.black26,
    );
  }
}
