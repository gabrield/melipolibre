import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:melipolibre/utils/app_assets.dart';
import 'package:melipolibre/utils/app_routes.dart';
import 'package:melipolibre/controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final logo = SvgPicture.asset(
    AppAssets.APP_LOGO,
    height: 280,
  );

  _toggleHiddenPassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  _login() {
    Auth.login(_userController.text, _passwordController.text).then((success) {
      if (success) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.MAIN_SCREEN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                logo,
                TextField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    labelText: "Usuário",
                    hintText: 'usuario@examplo.com.br',
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
                        onSubmitted: (_) async {
                          _login();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    _login();
                  },
                  child: const Text('Entrar'),
                ),
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
