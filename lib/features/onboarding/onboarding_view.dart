import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/onboarding/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: isDarkTheme ? _isDark(context) : _isLight(context),
    );
  }
}

Widget _isDark(context) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff343434), Colors.black],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: const OnboardingViewBody(),
  );
}

Widget _isLight(context) {
  return const OnboardingViewBody();
}
