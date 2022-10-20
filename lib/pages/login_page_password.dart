import 'package:flutter/material.dart';

import 'home_page.dart';

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
                obscureText: true,
                enabled: enabled,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
                onChanged: (value) {
                  pass = value;
                  if (value.length > 6) {
                    setState(() {
                      enabled = false;
                    });
                  }
                },
              ),
              Visibility(
                visible: !enabled,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (pass.isNotEmpty) {
                      HomePage.instance.user = user;
                      Navigator.of(context).pushReplacementNamed('/home');
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => HomePage(),
                      //   ),
                      // );
                    }
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
          Navigator.of(context).pushNamed('/flag'); // testar pushAndRemoveUntil
        },
        child: const Icon(Icons.question_mark),
        tooltip: 'Bodão de ajuda',
      ),
    );
  }
}
