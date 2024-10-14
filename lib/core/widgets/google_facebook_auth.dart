import 'package:flutter/material.dart';

import '../theming/styles.dart';
import 'app_text_button.dart';
class GoogleFacebookAuth extends StatelessWidget {
  const GoogleFacebookAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(buttonText: 'google', textStyle: TextStyles.font14DarkBlueMedium, onPressed: (){} , backgroundColor:  const Color(0xfff5f9fe),),
        const SizedBox(height: 20,),
        AppTextButton(buttonText: 'Facebook', textStyle: TextStyles.font14DarkBlueMedium, onPressed: (){} , backgroundColor:  const Color(0xfff5f9fe),),

      ],
    );
  }
}