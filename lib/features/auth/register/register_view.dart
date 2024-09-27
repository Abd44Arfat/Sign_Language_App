import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MaterialButton(
        child: Text("click me "),
          onPressed: () {
        Navigator.pushReplacementNamed(
          context, Routes.loginScreen);})),
    );
  }
}
