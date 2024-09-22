// ignore_for_file: deprecated_member_use

import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/config.dart';
import '../../provider/user_profile_provider.dart';
import '../utility/formatters.dart';
import 'app_bar.dart';
import 'app_error.dart';
import 'app_loading.dart';
import 'refreshindicatir_widget.dart';

class BuildTemplateMain extends StatelessWidget {
  //Scaffold
  final Key? scaffoldKey;
  final Widget? drawer;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;
  final String? imageBackground;
  //AppBar
  final Color? backgroundColorAppBar;
  final Color? surfaceTintColorAppBar;
  final dynamic bottom;
  final bool divider;
  final Widget? leading;
  final void Function()? onTapLeading;
  final EdgeInsetsGeometry? paddingAppBar;
  final Widget? widgetAppBar;
  final Widget? bottomNavigationBar;
  //PopSoope
  final bool canPop;
  final void Function(bool didPop)? onPopInvoked;
  //Other
  final EdgeInsetsGeometry? paddingScreen;
  final Widget child;
  final bool loadingMain;
  final bool loading;
  final bool loadingPage;
  final bool showAppbar;
  final String? msgError;
  final int item;
  final int totalItems;
  final void Function()? getMore;
  final Future<void> Function()? onRefresh;
  final bool scrollOnRefresh;
  final int currentPerPage;
  final int totalParPages;

  const BuildTemplateMain({
    super.key,
    //Scaffold
    this.scaffoldKey,
    this.drawer,
    this.resizeToAvoidBottomInset,
    this.appBar,
    this.imageBackground,
    //AppBar
    this.backgroundColorAppBar,
    this.surfaceTintColorAppBar,
    this.bottom,
    this.divider = false,
    this.leading,
    this.onTapLeading,
    this.paddingAppBar,
    this.widgetAppBar,
    this.bottomNavigationBar,
    this.showAppbar = true,
    //PopSoope
    this.canPop = true,
    this.onPopInvoked,
    //Other
    this.paddingScreen,
    required this.child,
    this.loadingMain = false,
    this.loading = false,
    this.loadingPage = false,
    this.msgError,
    this.item = 0,
    this.totalItems = 0,
    this.getMore,
    this.onRefresh,
    this.scrollOnRefresh = true,
    this.currentPerPage = 1,
    this.totalParPages = 1,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProfileProvider>();
    return PopScope(
      canPop: canPop,
      onPopInvoked: onPopInvoked,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.instance.white(context),
                image: imageBackground == null
                    ? null
                    : DecorationImage(
                        image: AssetImage(
                          imageBackground!,
                        ),
                        fit: BoxFit.fill,
                      ),
              ),
              child: Scaffold(
                key: scaffoldKey,
                drawer: drawer,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                backgroundColor: Colors.transparent,
                appBar: showAppbar
                    ? AppBars.basic(
                        context,
                        backgroundColor: backgroundColorAppBar,
                        bottom: bottom,
                        divider: divider,
                        leading: leading,
                        onTapLeading: onTapLeading,
                        paddingAppBar: paddingAppBar,
                        surfaceTintColor: surfaceTintColorAppBar,
                        widget: widgetAppBar,
                        name: provider.userProfile?.fullName,
                      )
                    : null,
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: NotificationListener(
                          onNotification: (ScrollEndNotification t) {
                            if (t.metrics.pixels > 0 && t.metrics.atEdge) {
                              if (item < totalItems ||
                                  currentPerPage < totalParPages) {
                                if (!loadingPage) {
                                  if (getMore != null) {
                                    getMore!();
                                  }
                                }
                              }
                            }
                            return true;
                          },
                          child: BuildRefreshIndicator(
                            onRefresh: (scrollOnRefresh && onRefresh != null)
                                ? onRefresh!
                                : () async {},
                            notificationPredicate: (notification) =>
                                (onRefresh == null || !scrollOnRefresh)
                                    ? false
                                    : true,
                            child: _buildBody(
                              context,
                              paddingScreen: paddingScreen,
                              loadingMain: loadingMain,
                              msgError: msgError,
                              onRefresh: onRefresh,
                              child: child,
                            ),
                          ),
                        ),
                      ),
                      if (loadingPage) AppLoading.bottomPage(context),
                    ],
                  ),
                ),
                bottomNavigationBar:
                    msgError == null ? bottomNavigationBar : null,
              ),
            ),
          ),
          if (loading) AppLoading.page(context),
        ],
      ),
    );
  }
}

Widget _buildBody(
  BuildContext context, {
  required EdgeInsetsGeometry? paddingScreen,
  required Widget? child,
  required bool loadingMain,
  required Future<void> Function()? onRefresh,
  required String? msgError,
}) {
  return Container(
    alignment: Alignment.topLeft,
    height: context.height,
    width: context.width,
    child: Padding(
      padding: paddingScreen ?? context.paddingScreenHorizontal,
      child: loadingMain
          ? AppLoading.main(context)
          : msgError != null
              ? AppError(
                  text: msgError,
                  onRefresh: onRefresh ?? () async {},
                )
              : child ?? Container(),
    ),
  );
}

Widget buildBodyDetail(
  BuildContext context, {
  String? textKey,
  String? textKey2,
  String? text,
  TextStyle? textStyle,
  TextStyle? textKeyStyle,
  String? textTitle,
  TextStyle? textTitleStyle,
  bool convertTheme = true,
  int flexTextKey = 2,
  int flexText = 4,
  bool noTextKey = false,
  Widget? widget,
  TextOverflow? overflow,
  int? maxLines,
  String? textUnit,
}) =>
    noTextKey
        ? Text(
            emptyToDash(text),
            style: textStyle ??
                AppTextStyle(
                  context,
                  convertTheme: convertTheme,
                ).kTextDefaultBlack,
          )
        : textTitle == null
            ? Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: flexTextKey,
                    child: textKey2 == null
                        ? Text(
                            emptyToDash(textKey),
                            style: textKeyStyle ??
                                AppTextStyle(
                                  context,
                                  convertTheme: convertTheme,
                                ).kTextDefaultGreyTurquoise,
                          )
                        : Wrap(children: [
                            Text(
                              textKey ?? '',
                              style: textKeyStyle ??
                                  AppTextStyle(
                                    context,
                                    convertTheme: convertTheme,
                                  ).kTextDefaultGreyTurquoise,
                            ),
                            Text(
                              '$textKey2 : ',
                              style: textKeyStyle ??
                                  AppTextStyle(
                                    context,
                                    convertTheme: convertTheme,
                                  ).kTextDefaultGreyTurquoise,
                            ),
                          ]),
                  ),
                  context.emptySizedWidthBoxLow,
                  Expanded(
                    flex: flexText,
                    child: widget ??
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                emptyToDash(text),
                                overflow: overflow,
                                maxLines: maxLines,
                                style: textStyle ??
                                    AppTextStyle(
                                      context,
                                      convertTheme: convertTheme,
                                    ).kTextDefaultBlack,
                              ),
                            ),
                            Visibility(
                              visible: textUnit != null,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: AppBorderRadius.defaultValue,
                                ),
                                child: Text(
                                  emptyToDash(textUnit),
                                  overflow: overflow,
                                  maxLines: maxLines,
                                  style: textStyle ??
                                      AppTextStyle(
                                        context,
                                        convertTheme: convertTheme,
                                      ).kTextDefaultBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                  ),
                ],
              )
            : Padding(
                padding: EdgeInsets.only(bottom: context.lowValue / 2),
                child: Text(
                  textTitle,
                  style: textTitleStyle ??
                      AppTextStyle(
                        context,
                        convertTheme: convertTheme,
                      ).kTextDefaultBlack,
                ),
              );
