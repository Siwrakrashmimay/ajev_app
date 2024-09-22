import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../utility/formatters.dart';
import 'inkwell.dart';

class AppError extends StatelessWidget {
  final String? text;
  final Future<void> Function() onRefresh;
  final bool fullScreen;
  const AppError({
    super.key,
    required this.text,
    required this.onRefresh,
    this.fullScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    return fullScreen
        ? SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: SizedBox(
                width: context.width,
                height: context.height -
                    ((kToolbarHeight + AppPadding.defaultValue) * 4),
                child: _buildBody(
                  context,
                  text: text,
                  onRefresh: onRefresh,
                ),
              ),
            ),
          )
        : _buildBody(
            context,
            text: text,
            onRefresh: onRefresh,
          );
  }

  Widget _buildBody(
    BuildContext context, {
    required String? text,
    required void Function()? onRefresh,
  }) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.emptySizedHeightBoxLow3x,
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.instance.greyTurquoise(context),
                  ),
                  borderRadius: BorderRadius.circular(
                    AppBorderRadius.defaultValue,
                  ),
                ),
                child: BuildInkWell(
                  onTap: onRefresh,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        ' รีเฟรช',
                        style: AppTextStyle(context).kTextDefaultGreyTurquoise,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.refresh,
                        size: context.iconSizeButton,
                        color: AppColors.instance.greyTurquoise(context),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: context.paddingNormalVertical,
                child: Text(
                  emptyToDash(text),
                  textAlign: TextAlign.center,
                  style: AppTextStyle(context).kTextDefaultBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
