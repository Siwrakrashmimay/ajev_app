// homebottomBarViewModel.dart

import 'package:ajev_application/main/bike/view/bikeView.dart';
import 'package:flutter/material.dart';
import '../../../utils/base/base_viewmodel.dart';
import '../../account/view/accountView.dart';
import '../../homeview/view/startPage.dart';
import '../../news/newsview.dart';
import '../../service/view/serviceView.dart';

class HomeBottomBarViewModel extends BaseViewModel {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Widget getSelectedWidget() {
    switch (_selectedIndex) {
      case 0:
        return const StartPage();
      case 1:
        return const BikeViewPage();
      case 2:
        return const ServiceViewPage();
      case 3:
        return const NewsViewPage();
      case 4:
        return const AccountViewPage();
      default:
        return const Text('Home Page');
    }
  }

  List<String> getIcons() {
    // Provide different icons based on the selected index
    List<String> icons = [
      'assets/image/Asset 10@4x.png',
      'assets/image/Asset 12@4x.png',
      'assets/image/Asset 14@4x.png',
      'assets/image/Asset 16@4x.png',
      'assets/image/Asset 18@4x.png',
    ];

    if (_selectedIndex == 0) {
      icons[0] = 'assets/image/Asset 9@4x.png'; // Selected icon
    } else if (_selectedIndex == 1) {
      icons[1] = 'assets/image/Asset 11@4x.png'; // Selected icon
    } else if (_selectedIndex == 2) {
      icons[2] = 'assets/image/Asset 13@4x.png'; // Selected icon
    } else if (_selectedIndex == 3) {
      icons[3] = 'assets/image/Asset 15@4x.png'; // Selected icon
    } else if (_selectedIndex == 4) {
      icons[4] = 'assets/image/Asset 17@4x.png'; // Selected icon
    }

    return icons;
  }
}
