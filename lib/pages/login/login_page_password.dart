import 'package:code_color/pages/sign_up/confirm_password.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class LoginPagePassword extends StatefulWidget {
  static LoginPagePassword instance = LoginPagePassword();
  late String user;

  @override
  State<LoginPagePassword> createState() => _LoginPagePasswordState();
}

class _LoginPagePasswordState extends State<LoginPagePassword> {
  String user = LoginPagePassword.instance.user;
  String pass = '';

  bool enabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Usuário: $user',
                ),
              ),
              TextField(
                textInputAction: TextInputAction.done,
                autofocus: true,
                obscureText: true,
                // enabled: enabled,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
                style: const TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                ),
                onChanged: (value) {
                  pass = value;
                  if (value.length > 0) {
                    setState(() {
                      enabled = false;
                    });
                  } else {
                    setState(
                      () {
                        enabled = true;
                      },
                    );
                  }
                },
                onEditingComplete: () {
                  goToNextPage(context);
                },
                onSubmitted: (value) {
                  print('chamar função de validação');
                },
              ),
              Visibility(
                visible: !enabled,
                child: ElevatedButton.icon(
                  onPressed: () {
                    goToNextPage(context);
                  },
                  icon: const Icon(Icons.navigate_next),
                  label: const Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ConfirmPassword.instance.user = user;
          ConfirmPassword.instance.pass = pass;
          Navigator.of(context)
              .pushReplacementNamed('/sign_up'); // testar pushAndRemoveUntil
        },
        tooltip: 'Bodão de ajuda',
        child: const Icon(Icons.question_mark),
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    if (pass.isNotEmpty) {
      HomePage.instance.user = user;
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }
}
