import 'package:flutter/material.dart';

import '../core/extension/extension.dart';
import 'config.dart';

class AppTextStyle {
  final BuildContext context;
  final bool convertTheme;
  AppTextStyle(
    this.context, {
    this.convertTheme = false,
  });

  double get sp => (MediaQuery.of(context).size.width / 3) / 100;

  DeviceScreen get deviceScreen => context.screenSize();

/*---HeadLineBlack---*/
  TextStyle get kHeadLine20Black => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 20
            : deviceScreen == DeviceScreen.tablet
                ? 22
                : 24,
        color: AppColors.instance.black(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kHeadLine16Black => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 16
            : deviceScreen == DeviceScreen.tablet
                ? 18
                : 20,
        color: AppColors.instance.black(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kHeadLine16Primary => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 16
            : deviceScreen == DeviceScreen.tablet
                ? 18
                : 20,
        color: AppColors.instance.primary(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kHeadLine14Black => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 14
            : deviceScreen == DeviceScreen.tablet
                ? 16
                : 18,
        color: AppColors.instance.black(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kHeadLine14GreyTurquoise => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 14
            : deviceScreen == DeviceScreen.tablet
                ? 16
                : 18,
        color: AppColors.instance.greyTurquoise(
          context,
          convertTheme: convertTheme,
        ),
      );

/*---BodyPrimary---*/
  TextStyle get kTextDefaultPrimary => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.primary(
          context,
          convertTheme: convertTheme,
        ),
      );

/*---BodyBlack---*/
  TextStyle get kText8Black => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 8
            : deviceScreen == DeviceScreen.tablet
                ? 10
                : 12,
        color: AppColors.instance.black(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kText10Black => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 10
            : deviceScreen == DeviceScreen.tablet
                ? 12
                : 14,
        color: AppColors.instance.black(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kTextDefaultBlack => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.black(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kTextDefaultPink => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.pink(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kTextDefaultCoral => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.coral(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kTextDefaultDarkGray => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 12
                : 12,
        color: AppColors.instance.darkGrey(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kText14Black => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 14
            : deviceScreen == DeviceScreen.tablet
                ? 16
                : 18,
        color: AppColors.instance.black(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kText16Black => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 16
            : deviceScreen == DeviceScreen.tablet
                ? 18
                : 20,
        color: AppColors.instance.black(
          context,
          convertTheme: convertTheme,
        ),
      );

/*---BodyWhite---*/
  TextStyle get kText8White => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 8
            : deviceScreen == DeviceScreen.tablet
                ? 10
                : 12,
        color: AppColors.instance.white(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kText10White => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 10
            : deviceScreen == DeviceScreen.tablet
                ? 12
                : 14,
        color: AppColors.instance.white(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kTextDefaultWhite => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.white(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kText16White => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 16
            : deviceScreen == DeviceScreen.tablet
                ? 18
                : 20,
        color: AppColors.instance.white(
          context,
          convertTheme: convertTheme,
        ),
      );
  /*---BodylightGray---*/

  TextStyle get kTextDefaultLightGray => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.lightGray(
          context,
          convertTheme: convertTheme,
        ),
      );

/*---BodyGreyTurquoise---*/
  TextStyle get kText8GreyTurquoise => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 8
            : deviceScreen == DeviceScreen.tablet
                ? 10
                : 12,
        color: AppColors.instance.greyTurquoise(
          context,
          convertTheme: convertTheme,
        ),
      );
  TextStyle get kText10GreyTurquoise => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 10
            : deviceScreen == DeviceScreen.tablet
                ? 12
                : 14,
        color: AppColors.instance.greyTurquoise(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kTextDefaultGreyTurquoise => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.greyTurquoise(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kTextDefaultGreenTurquoise => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.greenTurqoise(
          context,
          convertTheme: convertTheme,
        ),
      );

/*---BodyRed---*/
  TextStyle get kText16Red => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 16
            : deviceScreen == DeviceScreen.tablet
                ? 18
                : 20,
        color: AppColors.instance.red(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kTextDefaultRed => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.red(
          context,
          convertTheme: convertTheme,
        ),
      );

/*---BodyOrange---*/
  TextStyle get kTextDefaultOrange => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.orange(
          context,
          convertTheme: convertTheme,
        ),
      );

/*---BodyDisable---*/
  TextStyle get kTextDefaultDisable => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.disable(
          context,
          convertTheme: convertTheme,
        ),
      );

/*---BodyDodgerBlue---*/
  TextStyle get kTextDefaultDodgerBlue => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.dodgerBlue(
          context,
          convertTheme: convertTheme,
        ),
      );

/*---BodyCeruleanBlue---*/
  /*---BodyDodgerBlue---*/
  TextStyle get kTextDefaultCeruleanBlue => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 12
            : deviceScreen == DeviceScreen.tablet
                ? 14
                : 16,
        color: AppColors.instance.ceruleanBlue(
          context,
          convertTheme: convertTheme,
        ),
      );

  TextStyle get kText18blues => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile
            ? 18
            : deviceScreen == DeviceScreen.tablet
                ? 18
                : 20,
        color: AppColors.instance.blues(
          context,
          convertTheme: convertTheme,
        ),
      );
}
