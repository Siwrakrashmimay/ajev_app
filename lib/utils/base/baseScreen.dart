// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:provider/provider.dart';

import '../extension/device_screen_extention.dart';

class BaseScreen<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    T viewmodel,
    Widget? child,
    DeviceScreen deviceScreen,
  ) builder;

  final T viewmodel;
  final Widget? child;
  final void Function(T viewmodel)? onInitViewModel;
  final void Function(T viewmodel)? onInit;
  final void Function(T viewmodel)? onDispose;

  const BaseScreen({
    required this.viewmodel,
    required this.builder,
    this.onInit,
    this.child,
    this.onInitViewModel,
    this.onDispose,
    super.key,
  });

  @override
  BaseScreenState<T> createState() => BaseScreenState<T>();
}

class BaseScreenState<T extends ChangeNotifier> extends State<BaseScreen<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewmodel;

    if (widget.onInit != null) {
      widget.onInit!(model);
    }

    if (widget.onInitViewModel != null) {
      widget.onInitViewModel!(model);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!(model);
    }
    super.dispose();
  }

  Widget _baseScreen() => ChangeNotifierProvider<T>(
        create: (_) => model,
        child: Consumer<T>(
          builder: (context, value, child) {
            var deviceScreen = context.screenSize();
            return widget.builder(context, model, child, deviceScreen);
          },
          child: widget.child,
        ),
      );

  @override
  Widget build(BuildContext context) => _baseScreen();
}
