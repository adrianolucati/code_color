import 'package:flutter/material.dart';

class ConfirmPassword extends StatefulWidget {
  ConfirmPassword({super.key, this.title = 'Cadastre-se'});

  static ConfirmPassword instance = ConfirmPassword();

  final String title;
  String? user;
  String? pass;

  set setControllerUser(user) {
    user = user;
  }

  get getUser {
    return user;
  }

  set setcontrollerUpass(pass) {
    pass = pass;
  }

  get getPass {
    return pass;
  }

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerUser =
      TextEditingController(text: ConfirmPassword.instance.user);
  // _controllerUser.tex
  final TextEditingController _controllerPass =
      TextEditingController(text: ConfirmPassword.instance.pass);

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                textInputAction: TextInputAction.next,
                controller: _controllerUser,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                ),
                decoration: const InputDecoration(
                    labelText: 'Login (E-mail, CPF ou Celular)',
                    suffixIcon: Icon(Icons.edit)
                    // icon: Icon(Icons.edit),
                    ),
              ),
              TextField(
                textInputAction: TextInputAction.next,
                controller: _controllerPass,
                obscureText: hidePassword,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  labelText: 'Senha',
                ),
              ),
              TextField(
                textInputAction: TextInputAction.done,
                controller: _controllerPass,
                obscureText: hidePassword,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  labelText: 'Confirmar senha',
                ),
              ),
            ],
          ),
        ));
  }
}
