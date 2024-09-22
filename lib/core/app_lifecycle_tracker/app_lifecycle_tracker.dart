import 'package:flutter/material.dart';

import '../../main.dart';
import '../init/shared_perferences/shared_perferences.dart';
import '../utility/formatters.dart';
import 'enum/enum.dart';

class AppLifecycleTracker extends StatefulWidget {
  final Widget child;

  const AppLifecycleTracker({
    super.key,
    required this.child,
  });

  @override
  State<AppLifecycleTracker> createState() => _AppLifecycleTrackerState();
}

class _AppLifecycleTrackerState extends State<AppLifecycleTracker>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    AppState status;
    switch (state) {
      case AppLifecycleState.resumed:
        status = AppState.resumed;
        break;
      case AppLifecycleState.inactive:
        status = AppState.inactive;
        break;
      case AppLifecycleState.paused:
        status = AppState.paused;
        break;
      case AppLifecycleState.detached:
        status = AppState.detached;
        break;
      case AppLifecycleState.hidden:
        status = AppState.hidden;
        break;
    }
    debugPrint('AppLifecycleState: $status');
    _callApi(status);
  }

  // final _globalRepo = GlobalRepo();

  void _callApi(AppState state) async {
    switch (state) {
      case AppState.resumed:
        BuildContext? context = navigatorKey.currentState?.context;
        if (context != null) {
          final expiresAt = await Singleton.shared.getExpiresAt();
          final now = DateTime.now();
          if (emptyToNull(expiresAt) != null) {
            final kExpiresAt = DateTime.parse(expiresAt!);
            if (kExpiresAt.isBefore(now)) {
              if (context.mounted) {
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return const SplashScreen(popScreen: true);
                //   },
                // );
                // .
                // then(
                //   (value) async => await _globalRepo.setExpiresAt(),
                // );
              }
            }
          } else {
            // await _globalRepo.setExpiresAt();
          }
        }
        break;
      case AppState.detached:
        await Singleton.shared.setExpiresAt('');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
