import 'package:flutter/material.dart';
import 'package:prestige_automobile/constants/colors.dart';
import 'package:prestige_automobile/firebase/firebase.dart';
import 'package:prestige_automobile/widgets/am_text_field_widget.dart';

final _firebaseService = FirebaseServices();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.change});

  final VoidCallback change;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
            ),
            Center(
              child: SizedBox(
                width: 130,
                height: 100,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Center(
              child: Text(
                "Prestige Automobile",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AMTextFormField(
              maxLines: 1,
              controller: _emailController,
              textInputAction: TextInputAction.next,
              hint: "Email",
            ),
            const SizedBox(
              height: 20,
            ),
            AMTextFormField(
              observeText: !showPassword,
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              hint: "Password",
              validator: Validator.password,
              maxLines: 1,
              suffixIcon: IconButton(
                icon: showPassword
                    ? const Icon(
                        Icons.visibility,
                        color: kSecondaryColor,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: kSecondaryColor,
                      ),
                onPressed: () {
                  showPassword = !showPassword;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot password?, contact us",
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () async {
                  _firebaseService.firebaseSignIn(
                      _emailController.text, _passwordController.text, context);
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kSecondaryColor),
                  child: const Center(
                    child: Text("Login"),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Do not have an account? ",
                  style: TextStyle(fontSize: 12),
                ),
                GestureDetector(
                  onTap: () => widget.change(),
                  child: const Text(
                    " Register",
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
