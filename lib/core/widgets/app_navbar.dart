// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0; // ตั้งค่าเริ่มต้นให้แถบที่ถูกเลือกเริ่มต้นที่หน้าหลัก

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // เพิ่ม logic การนำทางไปยังหน้าอื่น ๆ ตามที่คุณต้องการ
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // ให้มีแถบที่ไม่เลื่อน
      backgroundColor: const Color(0xFF1A1A1A), // พื้นหลังสีเข้ม
      selectedItemColor: Colors.white, // สีของไอคอนและข้อความเมื่อถูกเลือก
      unselectedItemColor:
          Colors.white.withOpacity(0.5), // สีของไอคอนและข้อความที่ไม่ได้เลือก
      currentIndex: _selectedIndex, // แถบที่ถูกเลือก
      onTap: _onItemTapped, // ฟังก์ชันเมื่อกดเลือกแถบ
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'หน้าหลัก',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.motorcycle),
          label: 'ข้อมูลรถ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'บริการ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'ข่าวสาร',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'บัญชี',
        ),
      ],
    );
  }
}
