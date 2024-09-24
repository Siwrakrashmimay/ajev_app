// ignore_for_file: unnecessary_string_interpolations

import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';
import '../init/constants/image/image_constants.dart';
import '../init/navigation/route_manager.dart';
import 'app_image_view.dart';
import 'inkwell.dart';

class AppBars {
  static AppBar basic(
    BuildContext context, {
    Widget? leading,
    EdgeInsetsGeometry? paddingAppBar,
    void Function()? onTapLeading,
    bool divider = false,
    Color? backgroundColor,
    Color? surfaceTintColor,
    Widget? widget,
    String? nameWidget,
    dynamic bottom,
    String? name,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Colors.white,
      surfaceTintColor: surfaceTintColor,
      elevation: 0,
      title: SizedBox(
        height: kToolbarHeight,
        width: context.width,
        child: Padding(
          padding:
              paddingAppBar ?? EdgeInsets.only(right: context.paddingScreen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              nameWidget == null
                  ? Container(
                      padding: EdgeInsets.only(
                        top: context.paddingScreen,
                        left: context.paddingScreen,
                        right: context.normalValue,
                      ),
                      height: double.infinity,
                      child: BuildInkWell(
                        onTap: onTapLeading ?? () => AppNav.close(context),
                        child: leading ??
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: context.iconSizeButton,
                            ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.only(
                        top: context.paddingScreen,
                        left: context.paddingScreen,
                        right: context.normalValue,
                      ),
                      height: double.infinity,
                      child: BuildInkWell(
                        onTap: onTapLeading ?? () => AppNav.close(context),
                        child: leading ??
                            Text(
                              '$nameWidget',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                      ),
                    ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Transform.translate(
                    offset: const Offset(0, 10),
                    child: widget ??
                        AppImageView.imageAsset(
                          context,
                          name: ImageConstants.instance.logoajev,
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      titleSpacing: 0,
      bottom: bottom,
    );
  }
}
