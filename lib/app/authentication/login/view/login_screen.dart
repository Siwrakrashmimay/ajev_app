import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/init/constants/image/image_constants.dart';
import '../../../../core/init/navigation/navigation.dart';
import '../../../../core/utility/app_alert_dialog.dart';
import '../../../../core/widgets/app_elebutton.dart';
import '../../../../core/widgets/app_image_view.dart';
import '../../../../core/widgets/app_textformfield.dart';
import '../../../../core/widgets/template_screen.dart';
import '../view_model/login_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        viewmodel: LoginViewModel(context: context),
        builder: (context, viewmodel, child, deviceScreen) {
          return BuildTemplateMain(
              canPop: false,
              loading: viewmodel.loading,
              showAppbar: false,
              onPopInvoked: (didPop) => viewmodel.isExitWarning(context),
              paddingScreen: EdgeInsets.zero,
              imageBackground: ImageConstants.instance.splashscreen,
              child: Center(
                child: Stack(
                  children: [
                    _mainContent(context, viewmodel, deviceScreen),
                    _login(context, viewmodel, deviceScreen),
                  ],
                ),
              ));
        });
  }

  Widget _mainContent(BuildContext context, LoginViewModel viewmodel,
      DeviceScreen deviceScreen) {
    return Align(
      alignment: Alignment.topCenter,
      child: AppImageView.imageAsset(
        context,
        name: ImageConstants.instance.logo,
        width: context.width * 0.33,
        height: context.height * 0.33,
      ),
    );
  }

  Widget _login(BuildContext context, LoginViewModel viewmodel,
      DeviceScreen deviceScreen) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          AppImageView.imageAsset(
            context,
            name: ImageConstants.instance.rectangle,
            width: context.width,
            height: context.height * 0.67,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            bottom: 20,
            child: Form(
              key: viewmodel.formLoginKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'เข้าสู่ระบบ',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: context.height * 0.06),
                  ExtFormField(
                    hintText: 'เบอร์โทร/เลขบัตรประชาชน',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกเบอร์โทร/เลขบัตรประชาชน';
                      } else if (value.length < 10) {
                        return 'กรุณากรอกเบอร์โทร/เลขบัตรประชาชนให้ครบ 10 หลัก';
                      }
                      return null;
                    },
                    onChanged: (value) => viewmodel.userName = value,
                  ),
                  const Spacer(), // Pushes the button to the bottom
                  CustomElevatedButton(
                    onPressed: () {
                      if (viewmodel.formLoginKey.currentState!.validate()) {
                        viewmodel
                            .smsPost(context, phoneNumber: viewmodel.userName)
                            .then((value) {
                          if (context.mounted) {
                            AppNav.toNamed(context, AppNavConstants.OTP_LOGIN,
                                arguments: viewmodel.otpModel);
                          }
                        }).onError((error, stackTrace) {
                          if (context.mounted) {
                            AppAlertDialog.error(
                              context,
                              textError: '$error',
                              barrierDismissible: false,
                            );
                          }
                        });
                      } else {}
                    },
                    text: 'เข้าสู่ระบบ',
                    backgroundColor: AppColors.instance.blues(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
