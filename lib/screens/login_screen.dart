import 'package:flutter/material.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                    child: Text('Entrar'),
                  ),
                  //const Divider(),
                  TextButton(
                    onPressed: () {},
                    child: Text('Esqueci a senha'),
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
