import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:melipolibre/screens/splash_screen.dart';
import 'package:melipolibre/utils/app_routes.dart';
import 'package:melipolibre/screens/login_screen.dart';
import 'package:melipolibre/screens/main_screen.dart';

void main() {
  DartPluginRegistrant.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MelipoLibreApp());
}

class MelipoLibreApp extends StatelessWidget {
  const MelipoLibreApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melipolibre',
      theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
          primarySwatch: Colors.blue),
      routes: {
        AppRoutes.SPLASH_SCREEN: (_) => const SplashScreen(),
        AppRoutes.LOGIN_SCREEN: (_) => const LoginScreen(),
        AppRoutes.MAIN_SCREEN: (_) => const MainScreen(),
      },
      initialRoute: AppRoutes.SPLASH_SCREEN,
      debugShowCheckedModeBanner: false,
    );
  }
}
