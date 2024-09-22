import 'dart:io';

import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../init/constants/image/image_constants.dart';
import '../utility/formatters.dart';
import 'inkwell.dart';
import 'photo_view.dart';

class AppImageView {
  static Widget imageIcon(
    BuildContext context, {
    required String name,
    Color? color,
    double? size,
  }) {
    return ImageIcon(
      AssetImage(
        name,
      ),
      size: size ?? context.iconSizeLow,
      color: color ?? AppColors.instance.black(context),
    );
  }

  static Widget imageAsset(
    BuildContext context, {
    required String name,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return Image.asset(
      name,
      fit: fit,
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) =>
          _errorImage(height: height, width: width),
    );
  }

  static Widget imageFile(
    BuildContext context, {
    required String name,
    double? height,
    double? width,
    BoxFit? fit,
    bool onClick = true,
    double? aspectRatio,
  }) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 16 / 9,
      child: BuildInkWell(
        onTap: onClick
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoView(
                      namePath: name,
                    ),
                  ),
                );
              }
            : null,
        child: Image.file(
          File(name),
          fit: fit,
          height: height,
          width: width ?? context.width,
          errorBuilder: (context, error, stackTrace) =>
              _errorImage(height: height, width: width),
        ),
      ),
    );
  }

  static Widget imageNetwork(
    BuildContext context, {
    required String? name,
    double? height,
    double? width,
    BoxFit? fit,
    void Function()? onTapRemove,
    bool onClick = true,
    double? aspectRatio,
  }) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 16 / 9,
      child: BuildInkWell(
        onTap: (onClick && name != null)
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoView(
                      url: true,
                      namePath: name,
                    ),
                  ),
                );
              }
            : null,
        child: Stack(
          children: [
            Image.network(
              emptyToNull(name) ?? '',
              fit: fit,
              height: height,
              width: width ?? context.width,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return _lodingImage(height: height, width: width);
              },
              errorBuilder: (context, error, stackTrace) => _errorImage(
                height: height,
                width: width,
              ),
            ),
            if (onTapRemove != null)
              Positioned(
                top: 8,
                right: 8,
                child: Align(
                  alignment: Alignment.topRight,
                  child: BuildInkWell(
                    onTap: onTapRemove,
                    child: imageIcon(
                      context,
                      name: ImageConstants.instance.calendar,
                      color: AppColors.instance.red(context),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static Widget _errorImage({
    required double? height,
    required double? width,
  }) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }

  static Widget _lodingImage({
    required double? height,
    required double? width,
  }) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: const CupertinoActivityIndicator(),
      ),
    );
  }
}
