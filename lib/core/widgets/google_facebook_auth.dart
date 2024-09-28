import 'package:flutter/material.dart';

import '../theming/styles.dart';
import 'app_text_button.dart';

class GoogleFacebookAuth extends StatelessWidget {
  const GoogleFacebookAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(

          buttonText: 'Google',
          textStyle: TextStyles.font18BlackLight,
          onPressed: () {},
          backgroundColor: const Color(0xfff5f9fe),
        ),
        const SizedBox(
          height: 20,
        ),
        AppTextButton(
          buttonText: 'Facebook',
          textStyle: TextStyles.font18BlackLight,
          onPressed: () {},
          backgroundColor: const Color(0xfff5f9fe),
        ),
      ],
    );
  }
}
