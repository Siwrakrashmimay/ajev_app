import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../config/config.dart';
import '../init/constants/image/image_constants.dart';
import '../utility/formatters.dart';
import 'app_image_view.dart';
import 'inkwell.dart';

class AppWidget {
  static Widget textDataEmpty(
    BuildContext context, {
    String? text,
    TextStyle? style,
  }) {
    return Text(
      text ?? 'ไม่มีข้อมูล',
      style: style ?? AppTextStyle(context).kText10GreyTurquoise,
      textAlign: TextAlign.center,
    );
  }

  static Widget productDataEmpty(
    BuildContext context, {
    String? text,
    TextStyle? style,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: context.paddingLowVertical,
            child: AppImageView.imageIcon(
              context,
              name: ImageConstants.instance.addProduct,
              size: context.iconSizeHigh,
              color: AppColors.instance.greyTurquoise(context),
            ),
          ),
          AppWidget.textDataEmpty(context, text: 'ไม่พบข้อมูล'),
        ],
      ),
    );
  }

  static Widget textCardBody(
    BuildContext context, {
    required String textKey,
    String? textKey2,
    int textKeyFlex = 2,
    String? text,
    TextStyle? textStyle,
    int textFlex = 3,
    bool convertTheme = true,
    TextOverflow? overflow,
    String? textUnit,
    Widget? widget,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: textKeyFlex,
          child: Row(
            children: [
              Expanded(
                child: textKey2 == null
                    ? Text(
                        textKey,
                        style: textStyle ??
                            AppTextStyle(context).kTextDefaultGreyTurquoise,
                      )
                    : Wrap(
                        children: [
                          Text(
                            textKey,
                            style: textStyle ??
                                AppTextStyle(context).kTextDefaultGreyTurquoise,
                          ),
                          Text(
                            textKey2,
                            style: textStyle ??
                                AppTextStyle(context).kTextDefaultGreyTurquoise,
                          )
                        ],
                      ),
              ),
              Text(
                "   :   ",
                style: textStyle ??
                    AppTextStyle(context).kTextDefaultGreyTurquoise,
              )
            ],
          ),
        ),
        Expanded(
          flex: textFlex,
          child: Row(
            children: [
              Expanded(
                child: widget ??
                    Text(
                      emptyToDash(text),
                      style: textStyle ??
                          (emptyToNull(text) == null
                              ? AppTextStyle(context).kText10GreyTurquoise
                              : AppTextStyle(context).kTextDefaultBlack),
                    ),
              ),
              Visibility(
                visible: textUnit != null,
                child: Text(
                  emptyToDash(textUnit),
                  style: AppTextStyle(context).kTextDefaultBlack,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget buildCardMain(
    BuildContext context, {
    void Function()? onClick,
    required Widget widgetTitle,
    required Widget widgetBody,
    Widget? widgetAction,
  }) {
    return Padding(
      padding: context.onlyBottomPaddingNormal,
      child: BuildInkWell(
        onTap: onClick,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.lowValue * 1.5,
                      vertical: context.lowValue,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.instance.greylight(context),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 2,
                          spreadRadius: 1,
                          color: AppColors.instance.gainsBoro(context),
                        )
                      ],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppBorderRadius.defaultValue),
                      ),
                    ),
                    child: widgetTitle,
                  ),
                ),
              ],
            ),
            Container(
              padding: AppPadding.productListView,
              decoration: BoxDecoration(
                color: AppColors.instance.white(context),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: AppColors.instance.lightGray(context),
                  )
                ],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                    AppBorderRadius.defaultValue,
                  ),
                ),
              ),
              child: Column(
                children: [
                  widgetBody,
                  if (widgetAction != null) widgetAction,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildAppVersion(
    BuildContext context, {
    required String appVersion,
    required String appBuildNumber,
  }) {
    return appVersion == "0.0.0" && appBuildNumber == "0"
        ? const SizedBox()
        : Text(
            'version : $appVersion ( $appBuildNumber )',
            style: AppTextStyle(context).kTextDefaultWhite,
          );
  }

  static Widget showMore(
    BuildContext context, {
    required bool hasMoreProduct,
    required bool loading,
    required void Function()? onTap,
  }) {
    return Padding(
      padding: context.paddingLowVertical,
      child: hasMoreProduct
          ? BuildInkWell(
              onTap: loading ? null : onTap,
              child: Padding(
                padding: context.paddingLow,
                child: Text(
                  'แสดงเพิ่มเติม',
                  style: AppTextStyle(context).kTextDefaultBlack,
                ),
              ),
            )
          : Text(
              'ไม่พบรายการเพิ่มเติม',
              style: AppTextStyle(context).kTextDefaultBlack,
            ),
    );
  }
}
