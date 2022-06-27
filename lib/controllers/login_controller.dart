import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Auth {
  static Future<bool> register(String emailAddress, String password) async {
    final user =
        ParseUser(emailAddress.trim(), password.trim(), emailAddress.trim());
    final response = await user.signUp();
    return Future<bool>.value(response.success);
  }

  static Future<bool> login(String emailAddress, String password) async {
    final user = ParseUser(emailAddress.trim(), password.trim(), emailAddress);
    var response = await user.login();
    if (response.success) {
    } else {
      print(response.error?.message);
    }
    return Future<bool>.value(response.success);
  }

  static Future<bool> logout() async {
    Future<bool> isLogout = Future<bool>.value(false);
    try {
      ParseUser currentUser = await ParseUser.currentUser();
      var result = await currentUser.logout();
      isLogout = Future<bool>.value(result.success);
    } catch (e) {
      throw Exception(e);
    }
    return isLogout;
  }

  static Future<bool> isLogged() async {
    Future<bool> isLogged = Future<bool>.value(false);
    try {
      final ParseUser currentUser = await ParseUser.currentUser();
      isLogged = Future<bool>.value(currentUser.username != null);
    } catch (e) {
      print("isLogged ==============> " + e.toString());
    }
    return isLogged;
  }
}
