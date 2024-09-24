// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../app/main/view/main_screen.dart';
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
      switch (index) {
        case 0:
          MainScreen;
          break;
        case 1:
          // Navigate to vehicle info
          break;
        case 2:
          MainScreen; // Navigate to service
          break;
        case 3:
          MainScreen; // Navigate to news
          break;
        case 4:
          MainScreen; // Navigate to account
          break;
      }
    });
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
