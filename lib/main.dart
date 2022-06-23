import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

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
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
