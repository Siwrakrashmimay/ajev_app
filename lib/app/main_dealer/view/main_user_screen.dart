import 'package:flutter/material.dart';

import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/init/navigation/navigation.dart';
import '../../accuont/view/accuont_screen.dart';
import '../../service/view/service_screen.dart';

class MainDealerScreen extends StatefulWidget {
  const MainDealerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainDealerScreenState createState() => _MainDealerScreenState();
}

class _MainDealerScreenState extends State<MainDealerScreen> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const ServiceScreen(),
    const ServiceDealerScreen(),
    const AccuontScreen(),
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
        children: _pages,
      ),
      bottomNavigationBar: _buildCustomBottomNavBar(),
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 30),
        child: _buildCenterButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCustomBottomNavBar() {
    return Container(
      height: 95,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: _buildNavItem(
              index: 0,
              icon: Icons.build_outlined,
              label: 'เบิก/เคลม',
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: _buildNavItem(
              index: 2,
              icon: Icons.person_outline,
              label: 'บัญชี',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterButton() {
    final bool isSelected = _selectedIndex == 1;

    return GestureDetector(
      onTap: () => _onItemTapped(1),
      child: Container(
        height: 110,
        width: 140,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF1A1A1A),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            isSelected
                ? ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Colors.tealAccent.shade700,
                        Colors.cyanAccent.shade400
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds),
                    child: Image.asset(
                      ImageConstants.instance.ajiconnavbar,
                      width: 57,
                      height: 57,
                      color: Colors.white,
                      colorBlendMode: BlendMode.srcATop,
                    ),
                  )
                : Image.asset(
                    ImageConstants.instance.ajiconnavbar,
                    width: 57,
                    height: 57,
                    color: Colors.white,
                  ),
            Positioned(
              bottom: 0,
              child: isSelected
                  ? ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Colors.tealAccent.shade700,
                          Colors.cyanAccent.shade400
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(bounds),
                      child: Text(
                        'AJ EV',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.tealAccent.shade700,
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Text(
                      'AJ EV',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF00E3F4) : Colors.white,
            size: 35,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF00E3F4) : Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceDealerScreen extends StatelessWidget {
  const ServiceDealerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'บริการลูกค้า',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.red,
            ),
            onPressed: () {
              // Notification button pressed
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   image: AssetImage(
          //       'assets/background.png'), // Replace with your background image
          //   fit: BoxFit.cover,
          // ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          children: [
            _buildServiceTile(
              icon: ImageConstants.instance.resgistgerbuttonicon,
              label: 'ลงทะเบียน',
              width: 120,
              height: 120,
              onTap: () {
                AppNav.toNamed(context, AppNavConstants.ADD_NEW_USER);
              },
            ),
            _buildServiceTile(
              icon: ImageConstants.instance.servicebuttonicon,
              label: 'เช็คระยะ',
              width: 200,
              height: 120,
              onTap: () {
                AppNav.toNamed(context, AppNavConstants.DISTANCE);
              },
            ),
            _buildServiceTile(
              icon: ImageConstants.instance.repairbuttonicon,
              label: 'ซ่อมทั่วไป',
              width: 200,
              height: 120,
              onTap: () {
                AppNav.toNamed(context, AppNavConstants.GENERALREPIRS);
              },
            ),
            _buildServiceTile(
              icon: ImageConstants.instance.claimbuttonicon,
              label: 'เคลมสินค้า',
              width: 120,
              height: 120,
              onTap: () {
                AppNav.toNamed(context, AppNavConstants.CLAIM_SCREEN);
              },
            ),
            _buildServiceTile(
              icon: ImageConstants.instance.searchbuttonicon,
              label: 'ค้นหาข้อมูล',
              width: 200,
              height: 120,
              onTap: () {
                AppNav.toNamed(context, AppNavConstants.BIKE);
              },
            ),
            _buildServiceTile(
              icon: ImageConstants.instance.manualbuttonicon,
              label: 'คู่มือการใช้งาน',
              width: 200,
              height: 120,
              onTap: () {
                AppNav.toNamed(context, AppNavConstants.MANUAL_SCREEN);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceTile({
    required String icon,
    required String label,
    required double width,
    required double height,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 35, 35, 35),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Image.asset(
                icon,
                // fit: BoxFit.contain,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
