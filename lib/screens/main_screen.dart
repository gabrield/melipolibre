import 'package:flutter/material.dart';
import 'package:melipolibre/controllers/login_controller.dart';
import 'package:melipolibre/utils/app_routes.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Future<ParseUser> user = Auth.getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                Auth.logout().then(
                  (isLoggedOut) {
                    if (isLoggedOut) {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.LOGIN_SCREEN);
                    }
                  },
                );
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<ParseUser>(
              future: user,
              builder:
                  (BuildContext context, AsyncSnapshot<ParseUser> snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data?.emailAddress}");
                }
                return const CircularProgressIndicator();
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
