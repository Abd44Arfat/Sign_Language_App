import 'package:flutter/cupertino.dart';
import 'package:sign_lang_app/core/widgets/onboarding.dart';

class OnboardingPage3ViewBody extends StatelessWidget {
  const OnboardingPage3ViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Onboarding(imageUrl: 'assets/images/onboarding3.png', title: 'Learn Sign Language Basics', subTitle: 'Enhance your signing skills with real time feedback and practice exercises');
  }
}
