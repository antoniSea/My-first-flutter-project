// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailInput = TextEditingController();
    var passwordInput = TextEditingController();

    void login () {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Login!"),
      )
    );
    }
  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zaloguj się"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 230),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Email",
              labelText: "Wpisz email",
              prefixIcon: Icon(Icons.mail),
            ),
            controller: emailInput,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Hasło",
              labelText: "Wpisz hasło",
              prefixIcon: Icon(Icons.password),
            ),
            controller: passwordInput,
          ),
        ),
        TextButton(
          onPressed: login,
          child: Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: const Text(
              'Zaloguj się',
              style: TextStyle(color: Colors.white, fontSize: 19.0),
            ),
          ),
        ),
      ],)
    );
  }
}