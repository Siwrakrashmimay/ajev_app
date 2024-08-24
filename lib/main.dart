import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'main/homeviewbottomBar/view-model/homebottomBarViewModel.dart';
import 'main/login/view/loginview.dart';
import 'main/register/view-model/signup_view_model.dart';
import 'utils/navigation/navigation_constants.dart';
import 'utils/navigation/navigation_route.dart';
import 'Provider/user_data_providart.dart'; // Ensure correct import

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeBottomBarViewModel()),
        ChangeNotifierProvider(
            create: (_) => UserDataProvider()), // Add UserDataProvider
        ChangeNotifierProvider(
            create: (_) =>
                AuthViewModel(context: context)), // Add AuthViewModel
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Prompt',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginPage(),
        initialRoute: AppNavConstants.LOGIN,
      ),
    );
  }
}
