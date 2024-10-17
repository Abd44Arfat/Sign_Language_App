import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text(
          'Sign Talk',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0xFFA7D7A0),
              fontSize: 40),
        )),
        ShakeX(
            from: 50,
            duration: const Duration(seconds: 2),
            infinite: true,
            child: Container(
              color: ColorsManager.primaryColor,
              width: 100,
              height: 20,
            ))
      ],
    );
  }
}
