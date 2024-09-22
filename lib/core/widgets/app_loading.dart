import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/cupertino.dart';

import '../../config/config.dart';

class AppLoading {
  static Widget basic(BuildContext context) {
    return SafeArea(
      child: Container(
        width: context.width,
        height: context.height,
        color: AppColors.instance.black(context).withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            activityIndicator(context),
          ],
        ),
      ),
    );
  }

  static Widget main(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Padding(
        padding: context.paddingLowVertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            activityIndicatorPage(context),
          ],
        ),
      ),
    );
  }

  static Widget page(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        color: AppColors.instance.black(context).withOpacity(0.1),
        width: context.width,
        height: context.height,
        child: Padding(
          padding: context.paddingLowVertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              activityIndicatorPage(context),
            ],
          ),
        ),
      ),
    );
  }

  static Widget bottomPage(BuildContext context) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          activityIndicatorPage(context),
        ],
      ),
    );
  }

  static Widget defaults(BuildContext context) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          activityIndicator(context),
        ],
      ),
    );
  }

  static Widget activityIndicator(BuildContext context) {
    return CupertinoActivityIndicator(
      color: AppColors.instance.white(
        context,
      ),
    );
  }

  static Widget activityIndicatorPage(BuildContext context) {
    return CupertinoActivityIndicator(
      color: AppColors.instance.blues(
        context,
      ),
    );
  }
}
