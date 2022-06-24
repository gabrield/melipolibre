import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:melipolibre/utils/app_routes.dart';
//import 'package:melipolibre/utils/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

  _toggleHiddenPassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Future<bool> _login() async {
    String? key = await prefs.getString('api-key');
    bool isLogged = false;

    print('CHAVE $key');
    if (key != '') {
      print('COM CHAVE $key');
      isLogged = true;
    } else {
      print('SEM CHAVE');

      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        print('SALVANDO CHAVE CHAVE');
        key = _textToMd5(_userController.text + _passwordController.text);
        prefs.setString('api-key', key).then((value) => print(value));
        isLogged = true;
      }
    }
    return isLogged;
  }

  String _textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 250,
                ),
                TextField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    labelText: "Usuário",
                    hintText: 'user@example.com',
                    //errorText: _errorText,
                  ),
                  onSubmitted: (username) {
                    //validar aqui
                  },
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          suffixIcon: IconButton(
                            onPressed: _toggleHiddenPassword,
                            icon: Icon(_isHidden
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        onSubmitted: (_) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Future<bool> login = _login();
                    login.then((success) {
                      print('LOGIN =  $success');
                      if (success) {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.MAIN_SCREEN);
                      }
                    });
                  },
                  child: const Text('Entrar'),
                ),
                //const Divider(),
                TextButton(
                  onPressed: () {},
                  child: const Text('Esqueci a senha'),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {},
                  child: const Text('Cadastre-se'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
