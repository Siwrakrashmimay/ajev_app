import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../init/constants/image/image_constants.dart';
import '../init/navigation/route_manager.dart';
import 'app_image_view.dart';
import 'inkwell.dart';

class AppBars {
  static AppBar basic(BuildContext context,
      {Widget? leading,
      EdgeInsetsGeometry? paddingAppBar,
      void Function()? onTapLeading,
      bool divider = false,
      Color? backgroundColor,
      Color? surfaceTintColor,
      Widget? widget,
      dynamic bottom,
      String? name,
      bool automaticallyImplyLeading = true}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      surfaceTintColor: surfaceTintColor,
      elevation: 0,
      title: SizedBox(
        height: kToolbarHeight,
        width: context.width,
        child: Padding(
          padding:
              paddingAppBar ?? (EdgeInsets.only(right: context.paddingScreen)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              automaticallyImplyLeading
                  ? Container(
                      padding: EdgeInsets.only(
                        left: context.paddingScreen,
                        right: context.normalValue,
                      ),
                      height: double.infinity,
                      child: BuildInkWell(
                        onTap: onTapLeading ?? () => AppNav.close(context),
                        child: leading ??
                            AppImageView.imageIcon(
                              context,
                              name: ImageConstants.instance.arrowBack,
                              color: AppColors.instance.black(context),
                              size: context.iconSizeButton,
                            ),
                      ),
                    )
                  : Container(),
              // const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: widget ??
                      Text(
                        'ชื่อผู้ใช้งาน ${name ?? ''}',
                        style: AppTextStyle(context).kTextDefaultGreyTurquoise,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
      titleSpacing: 0,
      bottom: bottom,
    );
  }
}
