import 'package:flutter/material.dart';
import 'package:prestige_automobile/pages/login_page.dart';
import 'package:prestige_automobile/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isSwitchPage = true;

  void toggleScreens() {
    setState(() {
      isSwitchPage = !isSwitchPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSwitchPage) {
      return LoginPage(change: toggleScreens);
    } else {
      return RegisterPage(change: toggleScreens);
    }
  }
}
