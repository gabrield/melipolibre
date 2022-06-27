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
  late Future<ParseUser> user;

  @override
  initState() {
    super.initState();
    user = _getUser();
  }

  Future<ParseUser> _getUser() async {
    ParseUser user = await ParseUser.currentUser();
    return Future<ParseUser>.value(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                //print(await _getUser());
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
                  return Text("${snapshot.data?.username}");
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
