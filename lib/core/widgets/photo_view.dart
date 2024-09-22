import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../init/constants/image/image_constants.dart';
import '../init/navigation/navigation.dart';
import 'app_image_view.dart';
import 'inkwell.dart';

class PhotoView extends StatelessWidget {
  final String namePath;
  final bool url;
  const PhotoView({
    super.key,
    required this.namePath,
    this.url = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: context.height,
            width: context.width,
            child: InteractiveViewer(
              minScale: 0.1,
              maxScale: 10,
              child: !url
                  ? AppImageView.imageFile(
                      context,
                      onClick: false,
                      height: context.height,
                      width: context.width,
                      name: namePath,
                    )
                  : AppImageView.imageNetwork(
                      context,
                      onClick: false,
                      height: context.height,
                      width: context.width,
                      name: namePath,
                    ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 36, right: 36),
              child: Align(
                alignment: Alignment.topRight,
                child: BuildInkWell(
                  onTap: () => AppNav.close(context),
                  child: CircleAvatar(
                    backgroundColor: AppColors.instance.primary(context),
                    child: AppImageView.imageIcon(
                      context,
                      name: ImageConstants.instance.close,
                      size: context.iconSizeButton,
                      color: AppColors.instance.white(
                        context,
                        convertTheme: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
