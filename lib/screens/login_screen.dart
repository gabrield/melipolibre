import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  _toggleHiddenPassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.network(
                    "https://upload.wikimedia.org/wikipedia/commons/4/45/Scaptotrigona_bipunctata_stingless_bee_abelha_sem_ferrao_tubuna.svg",
                    width: 250,
                  ),
                  TextField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      labelText: "Usuário",
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                            labelText: "Usuário",
                            suffixIcon: IconButton(
                              onPressed: _toggleHiddenPassword,
                              icon: Icon(_isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Entrar'),
                  ),
                  //const Divider(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Esqueci a senha'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
