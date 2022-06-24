import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:melipolibre/utils/app_routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                prefs.remove('api-key').then((success) {
                  if (success) {
                    print('success removing');
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.LOGIN_SCREEN);
                  } else {
                    print('fail removing');
                  }
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: const [
          Center(child: Text('Teste')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
