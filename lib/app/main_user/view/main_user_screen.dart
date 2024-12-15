// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'package:ajev_application/app/user_account/view/accuont_screen.dart';
import 'package:ajev_application/app/user_srvice/view/service_screen.dart';
import 'package:ajev_application/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/base/base_screen.dart';
import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/widgets/template_screen.dart';
// import '../../accuont/view/accuont_screen.dart';
// import '../../bike/view/bike_screen.dart';
// import '../../news/view/news_screen.dart';
import '../../service/view/service_screen.dart';
import '../view_model/main_user_view.dart';

// floatingActionButton: FloatingActionButton(
//   onPressed: _toggleTheme,
//   backgroundColor: _themeMode == ThemeMode.normal
//       ? const Color(0xFF1A1A1A)
//       : Colors.white,
//   child: Icon(
//     Icons.brightness_6,
//     color: _themeMode == ThemeMode.normal ? Colors.white : Colors.black,
//   ),
// ),

enum ThemeMode { normal, white }

class MainUserScreen extends StatefulWidget {
  const MainUserScreen({super.key});

  @override
  _MainUserScreenState createState() => _MainUserScreenState();
}

class _MainUserScreenState extends State<MainUserScreen> {
  int _selectedIndex = 1;
  ThemeMode _themeMode = ThemeMode.white;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.normal ? ThemeMode.white : ThemeMode.normal;
    });
  }

  final List<Widget> _pages = [
    const ServiceUserScreen(),
    const MainContentScreen(),
    const AccuontUserScreen(),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

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
    final Color backgroundColor =
        _themeMode == ThemeMode.normal ? const Color(0xFF1A1A1A) : Colors.white;
    final Color iconColor =
        _themeMode == ThemeMode.normal ? Colors.white : const Color(0xFF1A1A1A);

    return Container(
      height: 95,
      decoration: BoxDecoration(color: backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: _buildNavItem(
              index: 0,
              icon: Icons.build_outlined,
              label: 'เบิก/เคลม',
              iconColor: iconColor,
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: _buildNavItem(
              index: 2,
              icon: Icons.person_outline,
              label: 'บัญชี',
              iconColor: iconColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterButton() {
    final bool isSelected = _selectedIndex == 1;
    final Color backgroundColor =
        _themeMode == ThemeMode.normal ? const Color(0xFF1A1A1A) : Colors.white;
    final Color textColor =
        _themeMode == ThemeMode.normal ? Colors.white : const Color(0xFF1A1A1A);

    return GestureDetector(
      onTap: () => _onItemTapped(1),
      child: Container(
        height: 110,
        width: 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
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
                      color: textColor,
                      colorBlendMode: BlendMode.srcATop,
                    ),
                  )
                : Image.asset(
                    ImageConstants.instance.ajiconnavbar,
                    width: 57,
                    height: 57,
                    color: textColor,
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
                          color: textColor,
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
                  : Text(
                      'AJ EV',
                      style: TextStyle(
                        color: textColor,
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
    required Color iconColor,
  }) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF00E3F4) : iconColor,
            size: 35,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF00E3F4) : iconColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class MainContentScreen extends StatelessWidget {
  const MainContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: MainUserView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          appBarThemeMode: AppBarThemeMode.dark,
          nameWidgetAppBar: 'ข้อมูลลูกค้า',
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          showBackButton: false,
          titleText: 'ข้อมูลลูกค้า',
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                _buildTopInfoBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // const SizedBox(height: 5),
                      _buildVehicleImage(context),
                      const SizedBox(height: 20),
                      _buildBatteryAndStatusRow(),
                      const SizedBox(height: 30),
                      _buildLockSlider(),
                      const SizedBox(height: 30),
                      _buildActionButtons(context, viewmodel),
                    ],
                  ),
                ),
              ],
            )),
          ),
        );
      },
    );
  }

  Widget _buildVehicleImage(
    BuildContext context,
  ) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Opacity(
        //   opacity: 0.1,
        //   child: Image.asset(
        //     'assets/images/background_logo.png', // โลโก้พื้นหลัง
        //     width: 300,
        //   ),
        // ),
        Image.asset(
          ImageConstants.instance.goddessimg00,
          width: 350,
          height: 300,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget _buildBatteryAndStatusRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.battery_charging_full, color: Colors.blue, size: 18),
                SizedBox(width: 5),
                Text(
                  '98%',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.battery_alert, color: Colors.red, size: 18),
                SizedBox(width: 5),
                Text(
                  '18%',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'ระยะทางที่เหลือ: 55 กม.',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),

        // Vehicle Status Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'ตรวจเช็คสถานะ:',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 5),
            ElevatedButton.icon(
              onPressed: () {
                // Handle vehicle status
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
              icon: const Icon(
                Icons.close,
                size: 16,
                color: Colors.white,
              ),
              label: const Text(
                'สถานะรถผิดปกติ',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLockSlider() {
    double dragPercent = 0.0;
    bool isLocked = true;

    return StatefulBuilder(
      builder: (context, setState) {
        void onHorizontalDragUpdate(DragUpdateDetails details) {
          setState(() {
            dragPercent += details.primaryDelta! / 300;
            dragPercent = dragPercent.clamp(0.0, 1.0);
          });
        }

        void onHorizontalDragEnd(DragEndDetails details) {
          setState(() {
            isLocked = dragPercent < 0.6;
            dragPercent = isLocked ? 0.0 : 1.175;
          });
        }

        return GestureDetector(
          onHorizontalDragUpdate: onHorizontalDragUpdate,
          onHorizontalDragEnd: onHorizontalDragEnd,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    'เลื่อนเพื่อปลดล็อครถ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              AnimatedPositioned(
                left: dragPercent * 240,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    isLocked ? Icons.lock : Icons.lock_open,
                    color: isLocked ? Colors.grey : Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopInfoBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildTopIcon(Icons.wifi, '5G'),
              const SizedBox(width: 10),
              _buildTopIcon(Icons.phone, ''),
              const SizedBox(width: 10),
              _buildTopIcon(Icons.bluetooth, ''),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'ความเร็วโดยเฉลี่ย',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              SizedBox(height: 5),
              Text(
                '42 กม./ชม.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopIcon(IconData icon, String label) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        if (label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, MainUserView viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCustomActionButton(
          icon: Icons.volume_up,
          label: 'ส่งสัญญาณ\nตามหารถ',
          isSelected: viewModel.isFirstButtonSelected,
          onTap: viewModel.toggleFirstButton,
        ),
        _buildCustomActionButton(
          icon: Icons.volume_off,
          label: 'ปิดสัญญาณ\nกันขโมย',
          isSelected: viewModel.isSecondButtonSelected,
          onTap: viewModel.toggleSecondButton,
        ),
      ],
    );
  }

  Widget _buildCustomActionButton({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 60,
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFF4FACFE), Color(0xFF00F2FE)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null, // ไม่มี Gradient เมื่อไม่ได้เลือก
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
