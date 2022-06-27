import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:melipolibre/screens/splash_screen.dart';
import 'package:melipolibre/utils/app_routes.dart';
import 'package:melipolibre/screens/login_screen.dart';
import 'package:melipolibre/screens/main_screen.dart';

void main() async {
  DartPluginRegistrant.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = '3Y9IfP4f8HJZ2ciMsanwzy3Y3Zsx3q7pjpfoorGp';
  const keyClientKey = 'MTqFa9GoIpdptDbln6WIqTc6ieCJZzboHW1mFtgR';
  const keyParseServerUrl = 'https://parseapi.back4app.com';
  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      coreStore: await CoreStoreSembastImp.getInstance());

  runApp(const MelipoLibreApp());
}

class MelipoLibreApp extends StatelessWidget {
  const MelipoLibreApp({Key? key}) : super(key: key);

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
        AppRoutes.MAIN_SCREEN: (_) => MainScreen(),
      },
      initialRoute: AppRoutes.SPLASH_SCREEN,
      debugShowCheckedModeBanner: false,
    );
  }
}
