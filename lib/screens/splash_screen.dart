import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:melipolibre/controllers/login_controller.dart';
import 'package:melipolibre/utils/app_assets.dart';
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

    Timer(const Duration(seconds: 4), () {
      Auth.isLogged().then(
        (isLogged) {
          if (isLogged) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.MAIN_SCREEN);
          } else {
            Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN_SCREEN);
          }
        },
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, AppAssets.APP_LOGO),
      context,
    );
    //precacheImage(logo.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: const [
                Text(
                  'Inicializando',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
