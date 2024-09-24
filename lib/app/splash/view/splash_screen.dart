// ignore_for_file: library_private_types_in_public_api

import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../core/base/base_screen.dart';
import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/init/navigation/navigation.dart';
import '../../../core/widgets/app_image_view.dart';
import '../view_model/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  final bool popScreen;
  const SplashScreen({super.key, this.popScreen = false});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _moveUp = false;
  bool _showButtons = false;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      viewmodel: SplashViewModel(context: context),
      onInitViewModel: (viewmodel) =>
          viewmodel.onInitViewModel(context, popScreen: widget.popScreen),
      builder: (context, viewmodel, child, deviceScreen) {
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              setState(() {
                _moveUp = true;
                _showButtons = true;
              });
            },
            child: Stack(
              children: [
                _buildBackground(context),
                _buildMainContent(context, viewmodel),
                _buildBottomText(context, viewmodel),
                _buildButtons(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF000000),
            Color(0xFF22282B),
            Color(0xFF22282B),
            Color(0xFF000000),
          ],
          stops: [0.0, 0.0986, 0.9094, 1.0],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context, SplashViewModel viewmodel) {
    return AnimatedSlide(
      offset: _moveUp ? const Offset(0, -0.15) : Offset.zero,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImageView.imageAsset(
              context,
              name: ImageConstants.instance.logoajev,
              width: context.width * 0.6,
              height: context.height * 0.3,
              fit: BoxFit.contain,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: _moveUp ? 0 : context.height * 0.1,
            ),
            Text(
              'V ${viewmodel.appVersion}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Positioned(
      bottom: 200,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: _showButtons ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Column(
          children: [
            _buildButton(context, "ผู้ใช้บริการ", Colors.black, 250, 60),
            const SizedBox(height: 20),
            _buildButton(context, "ร้านตัวแทนจำหน่าย", Colors.black, 250, 60),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color textColor,
      double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
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
          onPressed: () {
            AppNav.toNamed(context, AppNavConstants.LOGIN);
          },
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomText(BuildContext context, SplashViewModel viewmodel) {
    return const Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Text(
        'Copyright © by AJ EV',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    );
  }
}
