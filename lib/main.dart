import 'package:flutter/material.dart';
import 'package:melipolibre/utils/app_routes.dart';
import 'package:melipolibre/screens/login_screen.dart';
import 'package:melipolibre/screens/main_screen.dart';

void main() {
  runApp(const MelipoLibreApp());
}

class MelipoLibreApp extends StatelessWidget {
  const MelipoLibreApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MelipoLibre',
      theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
          primarySwatch: Colors.blue),
      routes: {
        AppRoutes.LOGIN_SCREEN: (_) => const LoginScreen(),
        AppRoutes.MAIN_SCREEN: (_) => const MainScreen(),
      },
      initialRoute: AppRoutes.LOGIN_SCREEN,
      debugShowCheckedModeBanner: false,
    );
  }
}
