import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/init/constants/image/image_constants.dart';
import '../../../../core/utility/app_alert_dialog.dart';
import '../../../../core/widgets/app_elebutton.dart';
import '../../../../core/widgets/app_image_view.dart';
import '../../../../core/widgets/app_textformfield.dart';
import '../../../../core/widgets/template_screen.dart';
import '../view-model/resgister_view_model.dart';

class ResgisterScreen extends StatelessWidget {
  const ResgisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        viewmodel: ResgisterViewModel(context: context),
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

  Widget _mainContent(BuildContext context, ResgisterViewModel viewmodel,
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

  Widget _login(BuildContext context, ResgisterViewModel viewmodel,
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
            left: 0,
            right: 0,
            top: 20,
            bottom: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IntrinsicHeight(
                  child: Form(
                    key: viewmodel.formResgisterKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'สมัครสมาชิก',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: context.height * 0.06),
                        ExtFormField(
                          hintText: 'ชื่อ',
                          keyboardType:
                              TextInputType.text, // เปลี่ยนให้ถูกต้องเป็น Text
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกชื่อ';
                            }
                            return null;
                          },
                          onChanged: (value) => viewmodel.name = value,
                        ),
                        SizedBox(height: context.height * 0.05),
                        ExtFormField(
                          hintText: 'นามสกุล',
                          keyboardType:
                              TextInputType.text, // เปลี่ยนให้ถูกต้องเป็น Text
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกนามสกุล';
                            }
                            return null;
                          },
                          onChanged: (value) => viewmodel.sername = value,
                        ),
                        SizedBox(height: context.height * 0.05),
                        ExtFormField(
                          hintText: 'เลขบัตรประชาชน',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกเลขบัตรประชาชน';
                            } else if (value.length != 13) {
                              return 'กรุณากรอกเลขบัตรประชาชนให้ครบ 13 หลัก';
                            }
                            return null;
                          },
                          onChanged: (value) => viewmodel.idcardnumber = value,
                        ),
                        SizedBox(height: context.height * 0.05),
                        ExtFormField(
                          hintText: 'อีเมล',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกเบอร์โทร';
                            } else if (value.length < 10) {
                              return 'กรุณากรอกเบอร์โทรให้ครบ 10 หลัก';
                            }
                            return null;
                          },
                          onChanged: (value) => viewmodel.email = value,
                        ),
                        SizedBox(height: context.height * 0.05),
                        ExtFormField(
                          hintText: 'เบอร์โทร',
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกเบอร์โทร';
                            } else if (value.length < 10) {
                              return 'กรุณากรอกเบอร์โทรให้ครบ 10 หลัก';
                            }
                            return null;
                          },
                          onChanged: (value) => viewmodel.tel = value,
                        ),
                        SizedBox(height: context.height * 0.05),
                        const Spacer(),
                        SizedBox(height: context.height * 0.06),
                        // ดันปุ่มไปที่ด้านล่าง
                        CustomElevatedButton(
                          onPressed: () {
                            if (viewmodel.formResgisterKey.currentState!
                                .validate()) {
                              viewmodel
                                  .prepareInfoResgister(
                                name: viewmodel.name,
                                surname: viewmodel.sername,
                                email: viewmodel.email,
                                phoneNumber: viewmodel.tel,
                                idCardNumber: viewmodel.idcardnumber,
                              )
                                  .then(
                                (onValue) {
                                  if (context.mounted) {}
                                },
                              ).onError((error, stackTrace) {
                                if (context.mounted) {
                                  AppAlertDialog.error(
                                    context,
                                    textError: '$error',
                                    barrierDismissible: false,
                                  );
                                }
                              });
                            }
                          },
                          paddinghorizontal: 110,
                          text: 'สมัครสมาชิก',
                          backgroundColor: AppColors.instance.blues(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
