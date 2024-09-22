import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../init/navigation/route_manager.dart';
import '../utility/formatters.dart';

class AppButton {
  static Widget saveData(
    BuildContext context, {
    required Function()? onPressed,
    String? text,
    TextStyle? style,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    Widget? widgetLeft,
    Widget? widgetRight,
    bool loading = false,
    bool convertTheme = false,
    Color? backgroundColor,
    Color? borderColor,
    EdgeInsetsGeometry? padding,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        disabledBackgroundColor: AppColors.instance.greyTurquoise(
          context,
          convertTheme: false,
        ),
        disabledForegroundColor: AppColors.instance.greyTurquoise(
          context,
          convertTheme: false,
        ),
        backgroundColor: backgroundColor ??
            AppColors.instance.green(
              context,
              convertTheme: convertTheme,
            ),
        surfaceTintColor: backgroundColor ??
            AppColors.instance.green(
              context,
              convertTheme: convertTheme,
            ),
        foregroundColor: backgroundColor ??
            AppColors.instance.green(
              context,
              convertTheme: convertTheme,
            ),
        shape: RoundedRectangleBorder(
          side: (borderColor != null)
              ? BorderSide(color: borderColor)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(
            AppBorderRadius.defaultValue,
          ),
        ),
      ),
      onPressed: (onPressed != null)
          ? () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            }
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        children: [
          if (widgetLeft != null)
            Row(
              children: [
                widgetLeft,
                context.emptySizedWidthBoxLow3x,
              ],
            ),
          Text(
            emptyToDash(text),
            style: style ??
                AppTextStyle(
                  context,
                  convertTheme: convertTheme,
                ).kTextDefaultWhite,
          ),
          if (widgetRight != null)
            Row(
              children: [
                context.emptySizedWidthBoxLow3x,
                widgetRight,
              ],
            ),
          if (loading)
            Row(
              children: [
                context.emptySizedWidthBoxLow3x,
                CupertinoActivityIndicator(
                  color: AppColors.instance.white(
                    context,
                    convertTheme: convertTheme,
                  ),
                  radius: context.iconLoading,
                ),
              ],
            ),
        ],
      ),
    );
  }

  static Widget cancel(
    BuildContext context, {
    Function()? onPressed,
    String? text,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    Widget? widget,
    bool loading = false,
    Color? backgroundColor,
    bool convertTheme = true,
    TextStyle? style,
    BorderSide side = BorderSide.none,
    EdgeInsetsGeometry? padding,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: padding,
          disabledBackgroundColor: AppColors.instance.greyTurquoise(context),
          disabledForegroundColor: AppColors.instance.greyTurquoise(context),
          foregroundColor: backgroundColor ??
              AppColors.instance.white(
                context,
                convertTheme: convertTheme,
              ),
          surfaceTintColor: backgroundColor ??
              AppColors.instance.white(
                context,
                convertTheme: convertTheme,
              ),
          backgroundColor: backgroundColor ??
              AppColors.instance.white(
                context,
                convertTheme: convertTheme,
              ),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppBorderRadius.defaultValue,
            ),
            side: side,
          ),
          elevation: 0),
      onPressed: onPressed == null
          ? () => AppNav.close(context)
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        children: [
          Text(
            emptyToDash(text),
            style: style ??
                AppTextStyle(
                  context,
                  convertTheme: convertTheme,
                ).kTextDefaultRed,
          ),
          if (widget != null)
            Row(
              children: [
                context.emptySizedWidthBoxLow3x,
                widget,
              ],
            ),
          if (loading)
            Row(
              children: [
                context.emptySizedWidthBoxLow3x,
                CupertinoActivityIndicator(
                  color: AppColors.instance.white(
                    context,
                    convertTheme: convertTheme,
                  ),
                  radius: context.iconLoading,
                ),
              ],
            ),
        ],
      ),
    );
  }

  static Widget addData(
    BuildContext context, {
    required Function()? onPressed,
    String? text,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    Widget? widget,
    bool loading = false,
    bool convertTheme = false,
    EdgeInsetsGeometry? padding,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        disabledBackgroundColor: AppColors.instance.greyTurquoise(context),
        disabledForegroundColor: AppColors.instance.greyTurquoise(context),
        backgroundColor: AppColors.instance.ceruleanBlue(
          context,
          convertTheme: convertTheme,
        ),
        surfaceTintColor: AppColors.instance.ceruleanBlue(
          context,
          convertTheme: convertTheme,
        ),
        foregroundColor: AppColors.instance.ceruleanBlue(
          context,
          convertTheme: convertTheme,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.btnAdd,
          ),
        ),
      ),
      onPressed: onPressed != null
          ? () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            }
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        children: [
          if (widget != null)
            Row(
              children: [
                widget,
                context.emptySizedWidthBoxLow3x,
              ],
            ),
          Text(
            emptyToDash(text),
            style: AppTextStyle(
              context,
              convertTheme: convertTheme,
            ).kTextDefaultWhite,
          ),
          if (loading)
            Row(
              children: [
                context.emptySizedWidthBoxLow3x,
                CupertinoActivityIndicator(
                  color: AppColors.instance.white(
                    context,
                    convertTheme: convertTheme,
                  ),
                  radius: context.iconLoading,
                ),
              ],
            ),
        ],
      ),
    );
  }

  static Widget icon(
    BuildContext context, {
    required Widget widget,
    required Function()? onPressed,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    bool loading = false,
    bool convertTheme = true,
    EdgeInsetsGeometry? padding,
    BorderSide? side,
    Color? shadowColor,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        disabledBackgroundColor: AppColors.instance.greyTurquoise(context),
        disabledForegroundColor: AppColors.instance.greyTurquoise(context),
        shadowColor: shadowColor ?? Colors.transparent,
        backgroundColor: AppColors.instance.white(
          context,
          convertTheme: convertTheme,
        ),
        surfaceTintColor: AppColors.instance.white(
          context,
          convertTheme: convertTheme,
        ),
        foregroundColor: AppColors.instance.white(
          context,
          convertTheme: convertTheme,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.defaultValue,
          ),
          side: side ??
              BorderSide(
                color: AppColors.instance.gainsBoro(
                  context,
                  convertTheme: convertTheme,
                ),
              ),
        ),
      ),
      onPressed: onPressed != null
          ? () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            }
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        children: [
          widget,
          if (loading)
            Row(
              children: [
                context.emptySizedWidthBoxLow3x,
                CupertinoActivityIndicator(
                  color: AppColors.instance.white(
                    context,
                    convertTheme: convertTheme,
                  ),
                  radius: context.iconLoading,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
