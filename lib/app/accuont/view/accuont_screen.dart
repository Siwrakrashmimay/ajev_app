import 'package:ajev_application/core/extension/extension.dart';
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
          nameWidgetAppBar: 'บัญชีของร้าน',
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          child: Column(
            children: [
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'EV ZERO อีวี ซีโร่',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'ร้านตัวแทนเกรด A\nโซน กรุงเทพมหานคร และ ปริมณฑล',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '2 พระราม 2 ซอย 42 แขวงบางมด เขตจอมทอง\nกรุงเทพมหานคร',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: context.height * 0.20),
                      _buildButton(context, 'การตั้งค่า', () {}),
                      const SizedBox(height: 20),
                      _buildButton(context, 'ติดต่อสอบถาม', () {
                        AppNav.toNamed(context, AppNavConstants.ARK);
                      }),
                      const SizedBox(height: 40),
                      InkWell(
                        onTap: () {
                          AppNav.toNameAndRemoveUntil(
                              context, AppNavConstants.DEFALT);
                        },
                        child: const Text(
                          'ออกจากระบบ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
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

  Widget _buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      width: 300,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.black, // สีของปุ่ม
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
}
