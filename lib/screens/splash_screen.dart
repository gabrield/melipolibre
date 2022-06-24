import 'dart:async';

import 'package:flutter/material.dart';
import 'package:melipolibre/controllers/login_controller.dart';
import 'package:melipolibre/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      /*
      Auth.login('test', 'passwd_test').then((isLogged) {
        if (isLogged == true) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.MAIN_SCREEN);
        } else {
          
        }
        */
      Auth.isLogged().then((isLogged) {
        if (isLogged == true) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.MAIN_SCREEN);
        } else {
          Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN_SCREEN);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 50,
        height: 50,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
