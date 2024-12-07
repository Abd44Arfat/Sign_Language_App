import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/onboarding.dart';

class OnboardingPage2ViewBody extends StatelessWidget {
  const OnboardingPage2ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Onboarding(
        imageUrl: isDark
            ? 'assets/images/onboarding2.png'
            : 'assets/images/Frame 247.png',
        title: 'Learn Sign Language Basics',
        subTitle:
            'Speak with Your Hands: Translate Signs into Text and Unlock New Connections!');
  }
}
