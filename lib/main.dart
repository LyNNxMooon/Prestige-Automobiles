import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prestige_automobile/constants/colors.dart';
import 'package:prestige_automobile/firebase_options.dart';
import 'package:prestige_automobile/pages/auth_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Prompt'),
      home: AnimatedSplashScreen(
          centered: true,
          duration: 1200,
          splashIconSize: double.infinity,
          splash: const SplashScreen(),
          nextScreen: const AuthPage(),
          splashTransition: SplashTransition.slideTransition,
          animationDuration: const Duration(milliseconds: 1200),
          backgroundColor: kPrimaryColor),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: SizedBox(
          width: 200,
          height: 170,
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    ));
  }
}
