import 'package:ajev_application/core/init/navigation/navigation.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/init/constants/image/image_constants.dart';
import '../../../../core/widgets/app_image_view.dart';
import '../../../../core/widgets/app_text_fromflel.dart';
import '../view_model/login_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogoMovedUp = false;
  bool _showTextFields = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLogoMovedUp = true;
      });
      Future.delayed(const Duration(milliseconds: 400), () {
        setState(() {
          _showTextFields = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      viewmodel: LoginViewModel(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return Scaffold(
          body: Stack(
            children: [
              _buildBackground(context),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    _buildAnimatedLogo(context),
                    if (_showTextFields) _buildTextFields(context, viewmodel),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: _buildCopyrightText(),
              ),
            ],
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

  Widget _buildAnimatedLogo(BuildContext context) {
    return AnimatedPositioned(
      top: _isLogoMovedUp ? 100 : MediaQuery.of(context).size.height * 0.4,
      left: 0,
      right: 0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Center(
        child: AppImageView.imageAsset(
          context,
          name: ImageConstants.instance.logoajev,
          width: context.width * 0.4,
          height: context.height * 0.2,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildTextFields(BuildContext context, LoginViewModel viewmodel) {
    return AnimatedOpacity(
      opacity: _showTextFields ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 2000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.height * 0.37),
          // const Text(
          //   'E-mail',
          //   style: TextStyle(fontSize: 16, color: Colors.white),
          // ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: context.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'E-mail',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const AppTextFormField(
                      hintText: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Code',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    AppTextFormField(
                      hintText: 'Please enter the code',
                      suffixIcon: TextButton(
                        onPressed: () {
                          // viewmodel.sendCode();
                        },
                        child: const Text(
                          'Send',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: viewmodel.agreed,
                          onChanged: (bool? value) {
                            // viewmodel.setAgreed(value!);
                          },
                        ),
                        const Expanded(
                          child: Text(
                            'I have read and agreed to the user agreement and privacy policy',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),

          const SizedBox(height: 45),
          Center(
            child: _buildButton(
              context,
              "เข้าสู่ระบบ / ลงทะเบียน",
              Colors.black,
              250,
              60,
            ),
          ),
        ],
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
            // viewmodel.login();
            AppNav.toNameAndRemoveUntil(
                context, AppNavConstants.MAIN_USER_PANG);
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

  Widget _buildCopyrightText() {
    return const Center(
      child: Text(
        'Copyright © by AJ EV',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
