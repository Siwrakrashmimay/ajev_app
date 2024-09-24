import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';
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
      String? nameWidget,
      dynamic bottom,
      String? name,
      bool automaticallyImplyLeading = false}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Colors.white, // สีพื้นหลังเป็นสีขาว
      surfaceTintColor: surfaceTintColor,
      elevation: 0, // ปรับ elevation ให้อยู่ในระดับต่ำสุด
      title: SizedBox(
        height: kToolbarHeight,
        width: context.width,
        child: Padding(
          padding:
              paddingAppBar ?? EdgeInsets.only(right: context.paddingScreen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon arrow back ทางซ้าย
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
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black, // สีของไอคอนเป็นสีดำ
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
              // โลโก้ตรงกลาง
              // AppImageView.imageAsset(
              //   context,
              //   name: ImageConstants
              //       .instance.logoajev, // ปรับชื่อรูปตามที่คุณใช้งาน
              //   width: 50,
              //   height: 50,
              //   fit: BoxFit.contain,
              // ),
              // ข้อความทางขวา (เช่นชื่อผู้ใช้)
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Transform.translate(
                    offset: const Offset(0, 10), // ขยับในแนวตั้งลง 10 หน่วย
                    child: widget ??
                        AppImageView.imageAsset(
                          context,
                          name: ImageConstants
                              .instance.logoajev, // ปรับชื่อรูปตามที่คุณใช้งาน
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
