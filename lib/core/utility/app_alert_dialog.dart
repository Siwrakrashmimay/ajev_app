import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../init/constants/image/image_constants.dart';
import '../init/langs/langs.dart';
import '../init/navigation/navigation.dart';
import '../widgets/app_button.dart';
import '../widgets/app_image_view.dart';
import '../widgets/textformfield_widget.dart';
import 'app_validator.dart';
import 'formatters.dart';

class AppAlertDialog {
  static Future<void> reject(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? subTitle,
    String? labelText,
    String? textValidator,
    Function()? onPressedCancel,
    required Function(String? value) onPressedSubmit,
    bool autoPop = true,
  }) async {
    final formKey = GlobalKey<FormState>();
    String? reason;
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            child: buildAlertDialog(context,
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? 'กรุณาระบุเหตุผล',
                            style: AppTextStyle(context).kTextDefaultOrange,
                          ),
                          Text(
                            subTitle ?? 'กรุณาระบุเหตุผล',
                            style: AppTextStyle(context).kText10GreyTurquoise,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    AppImageView.imageIcon(
                      context,
                      name: ImageConstants.instance.questionCircle,
                      color: AppColors.instance.orange(context),
                      size: 36,
                    ),
                  ],
                ),
                content: BuildTextFormField(
                  padding: EdgeInsets.zero,
                  bgColor: AppColors.instance.white(context),
                  labelText: labelText ?? 'เหตุผลเพิ่มเติม',
                  minLines: 3,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => AppValidator.validatorText(
                    value,
                    text: textValidator ?? 'กรุณาระบุเหตุผล',
                  ),
                  onChanged: (value) => reason = value,
                ),
                actions: Row(
                  children: [
                    Expanded(
                      child: AppButton.cancel(
                        context,
                        text: LocaleKeys.button_cancel.tr(),
                        style: AppTextStyle(context).kTextDefaultBlack,
                        side: BorderSide(
                          color: AppColors.instance.gainsBoro(context),
                        ),
                        onPressed: onPressedCancel,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppButton.saveData(
                        context,
                        backgroundColor: AppColors.instance.orange(context),
                        text: LocaleKeys.button_okay.tr(),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            autoPop
                                ? AppNav.close(
                                    context,
                                    result:
                                        onPressedSubmit(emptyToNull(reason)),
                                  )
                                : onPressedSubmit(emptyToNull(reason));
                          }
                        },
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  static Future submit(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? subTitle,
    Function()? onPressedCancel,
    required Function()? onPressedSubmit,
    String? textCancel,
    String? textSubmit,
    bool autoPop = true,
    String? assetName,
    Color? color,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return buildAlertDialog(
          context,
          title: Row(
            children: [
              AppImageView.imageIcon(
                context,
                name: assetName ?? ImageConstants.instance.checkWarning,
                color: color ?? AppColors.instance.salmonRose(context),
                size: 36,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? 'คุณต้องการบันทึกข้อมูลนี้ ?',
                      style: AppTextStyle(context).kTextDefaultOrange.copyWith(
                            color:
                                color ?? AppColors.instance.salmonRose(context),
                          ),
                    ),
                    Text(
                      subTitle ?? 'ระบบจะทำการบันทึกการดำเนินการของคุณ',
                      style: AppTextStyle(context).kText10GreyTurquoise,
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: Row(
            children: [
              Expanded(
                child: AppButton.cancel(
                  context,
                  text: textCancel ?? LocaleKeys.button_cancel.tr(),
                  style: AppTextStyle(context).kTextDefaultBlack,
                  side: BorderSide(
                    color: AppColors.instance.gainsBoro(context),
                  ),
                  onPressed: onPressedCancel,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton.saveData(context,
                    backgroundColor:
                        color ?? AppColors.instance.salmonRose(context),
                    text: textSubmit ?? LocaleKeys.button_okay.tr(),
                    onPressed: () {
                  if (onPressedSubmit != null) {
                    autoPop
                        ? AppNav.close(context, result: onPressedSubmit())
                        : onPressedSubmit();
                  }
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> success(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? subTitle,
    Function()? onPressedSubmit,
    bool autoPop = true,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return buildAlertDialog(
          context,
          // title: Row(
          // children: [
          //   AppImageView.imageIcon(
          //     context,
          //     name: ImageConstants.instance.checkCircle,
          //     color: AppColors.instance.green(context),
          //     size: 36,
          //   ),
          //   const SizedBox(width: 20),
          //   Expanded(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           title ?? 'การดำเนินการของคุณสำเร็จ !',
          //           style: AppTextStyle(context).kTextDefaultOrange.copyWith(
          //                 color: AppColors.instance.green(context),
          //               ),
          //         ),
          //         Text(
          //           subTitle ?? 'ระบบทำการบันทึกการดำเนินการของคุณแล้ว',
          //           style: AppTextStyle(context).kText10GreyTurquoise,
          //         ),
          //       ],
          //     ),
          //   ),
          // ],
          // ),
          borderRadius: BorderRadius.circular(20.0),
          // ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  ImageConstants.instance.greendialog,
                  width: context.width * 0.35,
                  height: context.width * 0.35,
                ),
                // color: AppColors.instance.red(context),
                // size: 36,
                const SizedBox(height: 20),
                Text(
                  title ?? 'การดำเนินการของคุณสำเร็จ !',
                  style: AppTextStyle(context).kText18blues,
                ),
                Text(
                  subTitle ?? 'ระบบทำการบันทึกการดำเนินการของคุณแล้ว',
                  style: AppTextStyle(context).kText10GreyTurquoise,
                ),
              ],
            ),
          ),
          actions: AppButton.saveData(
            context,
            backgroundColor: AppColors.instance.blues(context),
            text: LocaleKeys.button_okay.tr(),
            onPressed: () {
              autoPop
                  ? AppNav.close(
                      context,
                      result:
                          onPressedSubmit == null ? null : onPressedSubmit(),
                    )
                  : onPressedSubmit == null
                      ? null
                      : onPressedSubmit();
            },
          ),
        );
      },
    );
  }

  static Future<void> warning(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? subTitle,
    Function()? onPressedSubmit,
    bool autoPop = true,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return buildAlertDialog(
          context,
          // title: Row(
          // children: [
          //   AppImageView.imageIcon(
          //     context,
          //     name: ImageConstants.instance.checkCircle,
          //     color: AppColors.instance.green(context),
          //     size: 36,
          //   ),
          //   const SizedBox(width: 20),
          //   Expanded(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           title ?? 'การดำเนินการของคุณสำเร็จ !',
          //           style: AppTextStyle(context).kTextDefaultOrange.copyWith(
          //                 color: AppColors.instance.green(context),
          //               ),
          //         ),
          //         Text(
          //           subTitle ?? 'ระบบทำการบันทึกการดำเนินการของคุณแล้ว',
          //           style: AppTextStyle(context).kText10GreyTurquoise,
          //         ),
          //       ],
          //     ),
          //   ),
          // ],
          // ),
          borderRadius: BorderRadius.circular(20.0),
          // ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  ImageConstants.instance.warningdialog,
                  width: context.width * 0.35,
                  height: context.width * 0.35,
                ),
                // color: AppColors.instance.red(context),
                // size: 36,
                const SizedBox(height: 20),
                Text(
                  title ?? 'การดำเนินการของคุณสำเร็จ !',
                  style: AppTextStyle(context).kText18blues,
                ),
                Text(
                  subTitle ?? 'ระบบทำการบันทึกการดำเนินการของคุณแล้ว',
                  style: AppTextStyle(context).kText10GreyTurquoise,
                ),
              ],
            ),
          ),
          actions: AppButton.saveData(
            context,
            backgroundColor: AppColors.instance.blues(context),
            text: LocaleKeys.button_okay.tr(),
            onPressed: () {
              autoPop
                  ? AppNav.close(
                      context,
                      result:
                          onPressedSubmit == null ? null : onPressedSubmit(),
                    )
                  : onPressedSubmit == null
                      ? null
                      : onPressedSubmit();
            },
          ),
        );
      },
    );
  }

  static Future<void> error(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? textError,
    void Function()? onPressedSubmit,
    bool autoPop = true,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return buildAlertDialog(context,
            // title: Row(
            //   children: [
            //     // AppImageView.imageIcon(
            //     //   context,
            //     //   name: ImageConstants.instance.removeCircle,
            //     //   color: AppColors.instance.red(context),
            //     //   size: 36,
            //     // ),
            //     const SizedBox(width: 20),
            //     Text(
            //       title ?? 'เกิดข้อผิดลพลาด !',
            //       style: AppTextStyle(context).kTextDefaultRed,
            //     ),
            //   ],
            borderRadius: BorderRadius.circular(20.0),
            // ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    ImageConstants.instance.errordialog,
                    width: context.width * 0.35,
                    height: context.width * 0.35,
                  ),
                  // color: AppColors.instance.red(context),
                  // size: 36,
                  const SizedBox(height: 20),
                  Text(
                    title ?? 'เกิดข้อผิดลพลาด !',
                    style: AppTextStyle(context).kText18blues,
                  ),
                  Text(
                    emptyToDash(textError),
                    style: AppTextStyle(context).kText10GreyTurquoise,
                  ),
                ],
              ),
            ),
            actions: AppButton.saveData(
              context,
              backgroundColor: AppColors.instance.blues(context),
              text: LocaleKeys.button_okay.tr(),
              onPressed: () {
                autoPop ? AppNav.close(context) : null;
                if (onPressedSubmit != null) {
                  onPressedSubmit();
                }
              },
            ));
      },
    );
  }

  static Future<void> remove(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? subTitle,
    void Function()? onPressedCancel,
    required void Function() onPressedSubmit,
    bool autoPop = true,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return buildAlertDialog(
          context,
          title: Row(
            children: [
              AppImageView.imageIcon(
                context,
                name: ImageConstants.instance.removeCircle,
                color: AppColors.instance.red(context),
                size: 36,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? 'คุณต้องการลบรายการนี้ ?',
                      style: AppTextStyle(context).kTextDefaultOrange.copyWith(
                            color: AppColors.instance.red(context),
                          ),
                    ),
                    Text(
                      subTitle ?? 'กรุณากดตกลงเพื่อยืนยันการลบรายการนี้',
                      style: AppTextStyle(context).kText10GreyTurquoise,
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: Row(
            children: [
              Expanded(
                child: AppButton.saveData(
                  context,
                  backgroundColor: AppColors.instance.red(context),
                  text: LocaleKeys.button_okay.tr(),
                  onPressed: () {
                    autoPop ? AppNav.close(context) : null;
                    onPressedSubmit();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton.cancel(
                  context,
                  text: LocaleKeys.button_cancel.tr(),
                  style: AppTextStyle(context).kTextDefaultBlack,
                  side: BorderSide(
                    color: AppColors.instance.gainsBoro(context),
                  ),
                  onPressed: onPressedCancel ?? () => AppNav.close(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget buildAlertDialog(
  BuildContext context, {
  EdgeInsetsGeometry? titlePadding,
  Widget? title,
  EdgeInsetsGeometry? contentPadding,
  Widget? content,
  EdgeInsetsGeometry? actionsPadding,
  Widget? actions,
  BorderRadiusGeometry? borderRadius,
}) {
  double width = context.width;
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius ??
          BorderRadius.circular(
            AppBorderRadius.alertDialog,
          ),
      // side: BorderSide(
      //   color: AppColors.instance.white(
      //     context,
      //     convertTheme: false,
      //   ),
      // ),
    ),
    surfaceTintColor: AppColors.instance.grayAlabaster(context),
    backgroundColor: AppColors.instance.grayAlabaster(context),
    insetPadding: const EdgeInsets.symmetric(
      horizontal: 20,
      // vertical: 50,
    ),
    // titlePadding: titlePadding ??
    //     (content != null ? const EdgeInsets.only(bottom: 20) : EdgeInsets.zero),
    // title: Container(
    //   width: width,
    //   padding: const EdgeInsets.all(20),
    //   decoration: BoxDecoration(
    //     color: AppColors.instance.white(context),
    //     borderRadius: borderRadius ??
    //         BorderRadius.vertical(
    //           top: Radius.circular(
    //             AppBorderRadius.defaultValue,
    //           ),
    //         ),
    //     border: Border(
    //       bottom: BorderSide(
    //         color: AppColors.instance.gainsBoro(context),
    //       ),
    //     ),
    //   ),
    //   child: title,
    // ),
    contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 20),
    content: content != null
        ? SizedBox(
            width: width,
            child: content,
          )
        : null,
    actionsPadding: actionsPadding ??
        (content == null
            ? const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              )
            : const EdgeInsets.all(30)),
    actions: [
      SizedBox(
        width: width,
        child: actions,
      ),
    ],
  );
}
