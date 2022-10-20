import 'package:flutter/material.dart';
import 'login_page_password.dart';

class LoginPageUser extends StatefulWidget {
  const LoginPageUser({super.key});

  @override
  State<LoginPageUser> createState() => _LoginPageUserState();
}

class _LoginPageUserState extends State<LoginPageUser> {
  String user = '';
  bool enableButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identificação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  print(value.length);
                  if (value.isNotEmpty) {
                    user = value;
                    var lastInput =
                        value.substring(value.length - 1, value.length);
                    if (int.tryParse(lastInput) != null) {
                      print('número');
                      if (value.length == 1) {
                        print('Ativar teclado numérico');
                        keyboardType:
                        TextInputType.number;
                      }
                    } else if (lastInput == '@') {
                      print('Email');
                    } else {
                      print('texto');
                      keyboardType:
                      TextInputType.emailAddress;
                    }
                  }
                  if (value.length >= 11) {
                    setState(() {
                      enableButton = true;
                    });
                  } else {
                    setState(() {
                      enableButton = false;
                    });
                  }
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email, CPF ou Telefone com DDD',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: enableButton,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (user.length >= 11) {
                      LoginPagePassword.instance.user = user;
                      Navigator.of(context).pushNamed('/pass');
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => LoginPagePassword(),
                      //   ),
                      // );
                    }
                  },
                  icon: const Icon(Icons.navigate_next),
                  label: const Text('Avançar'),
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
        tooltip: 'Botão de ajuda',
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
