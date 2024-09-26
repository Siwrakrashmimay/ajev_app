// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'package:ajev_application/app/main_user/view_model/main_user_view.dart';
import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../core/base/base_screen.dart';
import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/widgets/template_screen.dart';
import '../../accuont/view/accuont_screen.dart';
import '../../bike/view/bike_screen.dart';
import '../../news/view/news_screen.dart';
import '../../service/view/service_screen.dart';

class MainUserScreen extends StatefulWidget {
  const MainUserScreen({super.key});

  @override
  _MainUSerScreenState createState() => _MainUSerScreenState();
}

class _MainUSerScreenState extends State<MainUserScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MainContentScreen(),
    const BikeScreen(),
    const ServiceScreen(),
    const NewsScreen(),
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
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: MainUserView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          nameWidgetAppBar: 'หน้าหลัก',
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          child: Center(
            child: SingleChildScrollView(
              child: _buildMainBody(context),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTopSection(context),
        const SizedBox(height: 30),
        _buildLockSlider(context),
        const SizedBox(height: 30),
        _buildActionIcons(context),
      ],
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageConstants.instance.goddessimg00,
          width: 400,
          height: context.dynamicHeight(0.4),
        ),
        const SizedBox(height: 10),
        _buildBatteryStatus(context),
      ],
    );
  }

  Widget _buildBatteryStatus(BuildContext context) {
    return Column(
      children: [
        _buildBatteryBar(context, 0.9, '100%'),
        const SizedBox(height: 10),
        _buildBatteryBar(context, 0.2, '100%'),
      ],
    );
  }

  Widget _buildBatteryBar(BuildContext context, double percent, String label) {
    return SizedBox(
      width: context.width * 0.8,
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade300,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox(
                      width: double.infinity,
                      height: 20,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade700,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: percent,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightBlue.shade50,
                                    Colors.blue.shade700,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  // Build the lock/unlock slider (remains unchanged)
  Widget _buildLockSlider(BuildContext context) {
    double _dragPercent = 0.0;
    bool _isLocked = true;

    return StatefulBuilder(
      builder: (context, setState) {
        void _onHorizontalDragUpdate(DragUpdateDetails details) {
          setState(() {
            _dragPercent += details.primaryDelta! / 200;
            _dragPercent = _dragPercent.clamp(0.0, 1.0);
          });
        }

        void _onHorizontalDragEnd(DragEndDetails details) {
          setState(() {
            if (_dragPercent > 0.6) {
              _isLocked = false;
            } else {
              _isLocked = true;
            }
            _dragPercent = _isLocked ? 0.0 : 1.0;
          });
        }

        return GestureDetector(
          onHorizontalDragUpdate: _onHorizontalDragUpdate,
          onHorizontalDragEnd: _onHorizontalDragEnd,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: _isLocked ? Colors.grey.shade800 : Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    'ปลดล็อครถ/ล็อครถ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              AnimatedPositioned(
                left: _dragPercent * 250,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    _isLocked ? Icons.lock : Icons.lock_open,
                    color: _isLocked ? Colors.grey : Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionIcons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionIcon(Icons.volume_up, 'ส่งสัญญาณตามหารถ'),
        _buildActionIcon(Icons.volume_off, 'ปิดเสียงกันขโมย'),
      ],
    );
  }

  Widget _buildActionIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          radius: 30,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
