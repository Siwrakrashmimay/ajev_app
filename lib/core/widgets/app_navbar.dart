// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../app/main/view/main_screen.dart';
import '../../app/service/view/service_screen.dart';
import '../init/constants/image/image_constants.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0; // Set initial selection

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Use Flutter's navigation to switch pages
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ServiceScreen()),
        );
        break;
      case 2:
        // เปลี่ยนไปหน้าจอที่คุณต้องการในเคสนี้
        break;
      case 3:
        // เปลี่ยนไปหน้าจอที่คุณต้องการในเคสนี้
        break;
      case 4:
        // เปลี่ยนไปหน้าจอที่คุณต้องการในเคสนี้
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
