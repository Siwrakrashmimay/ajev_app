import 'package:flutter/material.dart';

import '../../config/config.dart';

class AppDivider {
  static Widget horizontal(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Divider(
      height: height ?? 0,
      thickness: 1,
      color: color ?? AppColors.instance.gainsBoro(context),
    );
  }

  static Widget dotLineHorizontal(
    BuildContext context, {
    Color? color,
    double? width,
    double? height = 1,
  }) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 6.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color ?? AppColors.instance.darkGrey(context),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  static Widget vertical(
    BuildContext context, {
    Color? color,
  }) {
    return VerticalDivider(
      color: color ?? AppColors.instance.gainsBoro(context),
    );
  }
}
