import 'package:flutter/material.dart';

class BuildInkWell extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  const BuildInkWell({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
