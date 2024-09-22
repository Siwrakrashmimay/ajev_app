import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';

class BuildAlertDialog extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? elevation;
  final EdgeInsets? insetPadding;
  final EdgeInsetsGeometry? titlePadding;
  final Widget? title;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? content;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? actionsPadding;
  const BuildAlertDialog({
    super.key,
    this.width = 350,
    this.height,
    this.shape,
    this.surfaceTintColor,
    this.backgroundColor,
    this.shadowColor,
    this.elevation,
    this.insetPadding,
    this.titlePadding,
    this.title,
    this.contentPadding,
    this.content,
    this.actions,
    this.actionsPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AlertDialog(
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppBorderRadius.defaultValue,
              ),
            ),
        surfaceTintColor: surfaceTintColor ?? AppColors.instance.white(context),
        backgroundColor: backgroundColor ?? AppColors.instance.white(context),
        elevation: elevation,
        shadowColor: shadowColor,
        insetPadding: insetPadding ?? context.paddingAllScreen,
        titlePadding: titlePadding ?? EdgeInsets.zero,
        title: Container(
          width: width,
          padding: EdgeInsets.only(
            left: context.paddingScreen,
            right: context.paddingScreen,
            top: context.paddingScreen,
          ),
          child: title,
        ),
        contentPadding: contentPadding ?? EdgeInsets.zero,
        content: Container(
          width: width,
          height: height,
          padding: EdgeInsets.only(
            left: context.paddingScreen,
            right: context.paddingScreen,
            bottom: context.normalValue,
          ),
          child: content,
        ),
        actionsPadding: actionsPadding ?? EdgeInsets.zero,
        actions: [
          Container(
            width: width,
            color: Colors.amber,
            padding: actionsPadding ??
                EdgeInsets.only(
                  left: context.paddingScreen,
                  right: context.paddingScreen,
                  bottom: context.normalValue,
                ),
            child: Column(
              children: [
                ...actions ?? [],
              ],
            ),
          )
        ],
      ),
    );
  }
}
