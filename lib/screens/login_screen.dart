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
  bool _loginPressed = false;
  bool _validateUser = false;
  bool _validatePassword = false;
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final logo = SvgPicture.asset(
    AppAssets.APP_LOGO,
    height: 280,
  );

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
  }

  _toggleHiddenPassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  _login(context) async {
    setState(() {
      _validateUser = _userController.text.isEmpty;
      _validatePassword = _passwordController.text.isEmpty;
      _loginPressed = true;
    });
    try {
      var loginOk =
          await Auth.login(_userController.text, _passwordController.text);
      if (loginOk) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.MAIN_SCREEN);
      }
    } catch (e) {
      setState(() {
        _loginPressed = false;
      });
      _showError(e.toString());
    }
  }

  _showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                  decoration: InputDecoration(
                    errorText: _validateUser ? 'campo usuário vazio' : null,
                    labelText: "Usuário",
                    hintText: 'usuario@examplo.com.br',
                  ),
                  onSubmitted: (_) {
                    focusNode.requestFocus();
                  },
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _passwordController,
                        focusNode: focusNode,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          errorText:
                              _validatePassword ? 'campo senha vazio' : null,
                          labelText: "Senha",
                          suffixIcon: IconButton(
                            onPressed: _toggleHiddenPassword,
                            icon: Icon(_isHidden
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        onSubmitted: (_) async {
                          _login(context);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    _login(context);
                  },
                  child: _loginPressed
                      ? const SizedBox(
                          height: 12,
                          width: 12,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : const Text('Entrar'),
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
