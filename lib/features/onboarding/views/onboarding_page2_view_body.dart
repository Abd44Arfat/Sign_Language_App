import 'package:flutter/cupertino.dart';
import 'package:sign_lang_app/core/widgets/onboarding.dart';

class OnboardingPage2ViewBody extends StatelessWidget {
  const OnboardingPage2ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Onboarding(
        imageUrl: 'assets/images/onboarding2.png',
        title: 'Learn Sign Language Basics',
        subTitle:
            'Speak with Your Hands: Translate Signs into Text and Unlock New Connections!');
  }
}
