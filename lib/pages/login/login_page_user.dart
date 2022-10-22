import 'package:flutter/foundation.dart';
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

  TextInputType keyboardType_realtime = TextInputType.text;

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
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                ),
                onEditingComplete: () {
                  goToNextPage(context);
                },
                onChanged: (value) {
                  user = value;

                  setState(() {
                    keyboardType_realtime = changeKeyboardType(value);
                  });

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
                keyboardType: keyboardType_realtime,
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
                    goToNextPage(context);
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

  void goToNextPage(BuildContext context) {
    if (user.length >= 11) {
      LoginPagePassword.instance.user = user;
      Navigator.of(context).pushNamed('/pass');
    }
  }
}

TextInputType changeKeyboardType(String inputText) {
  TextInputType type = TextInputType.text;

  if (kDebugMode) {
    print(inputText.length);
  }
  if (inputText.isNotEmpty) {
    var lastInput = inputText.substring(inputText.length - 1, inputText.length);
    if (int.tryParse(lastInput) != null) {
      if (kDebugMode) {
        print('número');
      }
      if (inputText.length == 1) {
        if (kDebugMode) {
          print('Ativar teclado numérico');
        }
        return TextInputType.number;
      }
    } else if (lastInput == '@') {
      if (kDebugMode) {
        print('Email');
      }
      return TextInputType.emailAddress;
    } else if (lastInput == ' ' || lastInput == '(' || lastInput == ')') {
      if (kDebugMode) {
        print('Telefone');
      }
      return TextInputType.phone;
    } else {
      if (kDebugMode) {
        print('texto');
      }
      return TextInputType.text;
    }
  }

  return type;
}
