import 'package:flutter/material.dart';
import 'package:prestige_automobile/constants/colors.dart';

class AddFormPage extends StatefulWidget {
  const AddFormPage({super.key});

  @override
  State<AddFormPage> createState() => _AddFormPageState();
}

class _AddFormPageState extends State<AddFormPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
    ));
  }
}
