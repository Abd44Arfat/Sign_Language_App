import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/features/common_words/common_words_view.dart';
import 'package:sign_lang_app/features/onboarding/onboarding_view.dart';
import 'package:sign_lang_app/features/splash/splash_view.dart';

import '../../features/bottom_nav/button_navigation.dart';


class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.splashScreen :
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
    );
      case Routes.bottomNavigationScreen:
        return MaterialPageRoute(
          builder: (_) => const BottomNavigation(),
        );
      case Routes.commonWordsScreen :
        return MaterialPageRoute(
          builder: (_) => const CommonWordsView(),
        );
      default:
        return null;
    }
  }
}