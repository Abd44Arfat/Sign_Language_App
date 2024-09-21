import 'package:flutter/cupertino.dart';
import 'package:sign_lang_app/core/widgets/onboarding.dart';

class OnboardingPage1ViewBody extends StatelessWidget {
  const OnboardingPage1ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Onboarding(
        imageUrl: 'assets/images/onboarding_person.png',
        title: 'Practice Communication Skills',
        subTitle:
            'Enhance your signing skills with real time feedback and practice exercises', );
  }
}
