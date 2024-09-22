import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/init/constants/image/image_constants.dart';
import '../../../../core/utility/app_alert_dialog.dart';
import '../../../../core/widgets/app_elebutton.dart';
import '../../../../core/widgets/app_image_view.dart';
import '../../../../core/widgets/app_otp.dart';
import '../../../../core/widgets/template_screen.dart';
import '../view-model/otp_login_view.dart';

class OtpLoginView extends StatelessWidget {
  const OtpLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) => viewmodel.onInit(context),
      viewmodel: OtpLoginViewModel(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          canPop: true,
          loading: viewmodel.loading,
          showAppbar: false,
          onPopInvoked: (didPop) => viewmodel.isExitWarning(context),
          paddingScreen: EdgeInsets.zero,
          imageBackground: ImageConstants.instance.splashscreen,
          child: Center(
            child: Stack(
              children: [
                _mainContent(context, viewmodel, deviceScreen),
                _otp(context, viewmodel, deviceScreen)
                // _login(context, viewmodel, deviceScreen),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _mainContent(BuildContext context, OtpLoginViewModel viewmodel,
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

  Widget _otp(BuildContext context, OtpLoginViewModel viewmodel,
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
              // key: viewmodel.formLoginKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'รหัส OTP',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'กรุณากรอกรหัส OTP 6 หลักที่ได้รับทาง SMS',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'เบอร์ ${viewmodel.phoneNumber}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: context.height * 0.08),
                  OtpField(
                    length: 6,
                    onChanged: (value) {
                      viewmodel.otpNumberValue = value;
                    },
                  ),
                  SizedBox(height: context.height * 0.04),
                  Text(
                    'ไม่ได้รับรหัส OTP?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: context.height * 0.01),
                  viewmodel.isSetNewOtp
                      ? TextButton(
                          onPressed: () {
                            viewmodel.toggleIsSetNewOtp();
                          },
                          child: Text('กดส่งรหัสใหม่',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.instance
                                        .blues(context), // กำหนดสีที่คุณต้องการ
                                  )),
                        )
                      : Text(
                          'รอรหัส OTP ใหม่ใน 60 วินาที',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () {
                      if (viewmodel.otpNumber.length < 6) {
                        AppAlertDialog.warning(
                          context,
                          title: 'เกิดข้อผิดพลาด',
                          subTitle: 'กรุณากรอกรหัส OTP ให้ครบ 6 หลัก',
                        );
                        return;
                      } else if (viewmodel.otpNumber.length == 6) {
                        viewmodel
                            .postOtpvalidate(
                          otp: viewmodel.otpNumber,
                        )
                            .then((value) {
                          if (context.mounted) {
                            AppAlertDialog.success(
                              context,
                              subTitle: 'ยืนยัน OTP สำเร็จ',
                            );
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
                      } else {
                        AppAlertDialog.error(
                          context,
                          textError: 'เกิดข้อผิดพลาดกรุณาลองใหม่อีกครั้ง',
                        );
                      }
                    },
                    text: 'ยืนยัน OTP',
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
