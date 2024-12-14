import 'package:flutter/material.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/init/constants/image/image_constants.dart';
import '../../../../core/widgets/template_screen.dart';
import '../view_model/ark_view.dart';

class ArkScreen extends StatelessWidget {
  const ArkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: ArkView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          titleText: '',
          showBackButton: true,
          paddingScreen: EdgeInsets.zero,
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          showAppbar: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(Icons.facebook),
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.camera_alt),
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.message),
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.video_library),
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.music_note),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'ajev.official',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                _buildWebsiteSection(),
                const SizedBox(height: 30),
                _buildPhoneSection(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.black,
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget _buildWebsiteSection() {
    return const Column(
      children: [
        Icon(Icons.language, size: 50),
        SizedBox(height: 10),
        Text(
          'www.aj-ev.com',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPhoneSection() {
    return const Column(
      children: [
        Icon(Icons.phone, size: 50),
        SizedBox(height: 10),
        Text(
          '1108',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
