import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prestige_automobile/pages/login_page.dart';
import 'package:prestige_automobile/pages/navigator_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //Navigator.pop(context);
            Fluttertoast.showToast(msg: "Successfully Login!");
            return const NavigatorPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
