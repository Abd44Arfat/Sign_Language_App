import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/onboarding/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff343434), // Starting color
             Colors.black // Ending color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: OnboardingViewBody(),
      ),
    );
  }
}