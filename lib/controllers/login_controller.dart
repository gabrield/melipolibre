import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class Auth {
  static final EncryptedSharedPreferences _prefs = EncryptedSharedPreferences();

  static Future<bool> login(user, password) async {
    Future<bool> okLogin = Future<bool>.value(false);
    if ((user != null) && (password != null)) {
      EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
      String key = await prefs.getString('api-key');

      if (key.isNotEmpty) {
        okLogin = Future<bool>.value(true);
      } else {
        if (user.isNotEmpty && password.isNotEmpty) {
          /*COLOCAR AQUI A LOGICA DE AUTENTICAÇÃO COM API*/
          key = (user + password); // mock key
          await prefs.setString('api-key', key);
          okLogin = Future<bool>.value(true);
        }
      }
    }
    return okLogin;
  }

  static Future<bool> logout() async {
    Future<bool> isLoggedOut = Future<bool>.value(false);
    await _prefs.remove('api-key').then((success) {
      isLoggedOut = Future<bool>.value(success);
    });
    return isLoggedOut;
  }

  static Future<bool> isLogged() async {
    Future<bool> isLogged = Future<bool>.value(false);
    await _prefs.getString('api-key').then((key) {
      if (key.isNotEmpty) {
        isLogged = Future<bool>.value(true);
      }
    });
    return isLogged;
  }
}
