import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/features/common_words/common_words_view.dart';
import 'package:sign_lang_app/features/dictionary/data/dictionary_repo_impl.dart';
import 'package:sign_lang_app/features/dictionary/domain/usecases/fetch_dictionary_list_useCase.dart';
import 'package:sign_lang_app/features/dictionary/presentation/dictionary_view.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';
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
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.bottomNavigationScreen:
        return MaterialPageRoute(
          builder: (_) => const BottomNavigation(),
        );
      case Routes.commonWordsScreen:
        return MaterialPageRoute(
          builder: (_) => const CommonWordsView(),
        );
      case Routes.dictionaryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FetchDictionaryListCubit(FetchDictionaryListUsecase(
getIt.get<DictionaryRepoImpl>()

            )),
            child: const DictionaryView(),
          ),
        );
      default:
        return null;
    }
  }
}
