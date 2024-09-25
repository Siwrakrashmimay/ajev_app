// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../core/base/base_screen.dart';
import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/init/navigation/navigation.dart';
import '../../../core/widgets/template_screen.dart';
import '../../bike/view/bike_screen.dart';
import '../../service/view/service_screen.dart';
import '../view-model/main_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MainContentScreen(),
    const BikeScreen(),
    const ServiceScreen(),
    const MainContentScreen(),
    const MainContentScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages, // Display selected page from list
      ),
      bottomNavigationBar: _buildCustomNavigationBar(),
    );
  }

  Widget _buildCustomNavigationBar() {
    return Container(
      color: const Color(0xFF1A1A1A), // Background color
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            index: 0,
            iconPath: ImageConstants.instance.home,
            selectedIconPath: ImageConstants.instance.hometap,
          ),
          _buildNavItem(
            index: 1,
            iconPath: ImageConstants.instance.bike,
            selectedIconPath: ImageConstants.instance.biketap,
          ),
          _buildNavItem(
            index: 2,
            iconPath: ImageConstants.instance.service,
            selectedIconPath: ImageConstants.instance.servicetap,
          ),
          _buildNavItem(
            index: 3,
            iconPath: ImageConstants.instance.news,
            selectedIconPath: ImageConstants.instance.newstap,
          ),
          _buildNavItem(
            index: 4,
            iconPath: ImageConstants.instance.vector,
            selectedIconPath: ImageConstants.instance.vectortap,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconPath,
    required String selectedIconPath,
  }) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Image.asset(
        _selectedIndex == index ? selectedIconPath : iconPath,
        width: 60,
        height: 60,
      ),
    );
  }
}

class MainContentScreen extends StatelessWidget {
  const MainContentScreen({super.key});

  @override
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
              child: Center(child: _buildMainBody(context)));
        });
  }

  Widget _buildMainBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTopSection(context),
        const SizedBox(height: 30),
        _buildBottomSection(context),
      ],
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageConstants.instance.group48,
          width: 200,
          height: 150,
        ),
        const SizedBox(height: 10),
        _buildButton(context, 'ลงข้อมูลลูกค้าใหม่', Colors.white, () {
          AppNav.toNamed(context, AppNavConstants.ADD_NEW_USER);
        }, 250, 75),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'ลงข้อมูลสำหรับลูกค้าใหม่ หรือ ลูกค้าที่ซื้อรถเพิ่ม',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageConstants.instance.group75,
          width: 200,
          height: 150,
        ),
        const SizedBox(height: 10),
        _buildButton(context, 'ตรวจเช็คข้อมูลรถลูกค้า', Colors.white, () {
          AppNav.toNamed(context, AppNavConstants.BIKE);
        }, 250, 75),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'ตรวจเช็คข้อมูลรถลูกค้าที่มีในระบบ',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String text, Color textColor,
      VoidCallback onPressed, double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide.none,
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
