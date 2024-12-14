import 'package:flutter/material.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/widgets/template_screen.dart';
import '../../../core/init/navigation/navigation.dart';
import '../view_model/accuont_view.dart';

class AccuontScreen extends StatelessWidget {
  const AccuontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: AccuontView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          nameWidgetAppBar: 'บัญชีศูนย์บริการ',
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          showBackButton: false,
          titleText: 'บัญชีศูนย์บริการ',
          child: Column(
            children: [
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildStoreInfoBox(),
                      const SizedBox(height: 40),
                      _buildButton(context, 'การตั้งค่า', Colors.black, () {}),
                      const SizedBox(height: 20),
                      _buildButton(context, 'ติดต่อ AJ EV', Colors.black, () {
                        AppNav.toNamed(context, AppNavConstants.ARK);
                      }),
                      const SizedBox(height: 40),
                      _buildLogoutButton(context),
                      const SizedBox(height: 20),
                      const Text(
                        'App V.1.0.00',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStoreInfoBox() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: const Column(
        children: [
          Text(
            'EV ZERO อีวี ซีโร่',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '2 พระราม2ซอย 42 แขวงบางมด\nเขตจอมทอง กรุงเทพมหานคร',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'ร้านตัวแทนเกรด A\nโซน กรุงเทพมหานคร และ ปริมณฑล',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color backgroundColor,
      VoidCallback onPressed) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          side: const BorderSide(color: Colors.black),
        ),
        onPressed: () {
          AppNav.toNameAndRemoveUntil(context, AppNavConstants.DEFALT);
        },
        child: const Text(
          'ออกจากระบบ',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
