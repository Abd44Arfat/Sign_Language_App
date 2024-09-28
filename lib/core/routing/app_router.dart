import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/create_new_password_view.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/get_verification_code_view.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/reset_password_view.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/local_data_source.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/remote_data_source.dart';
import 'package:sign_lang_app/features/dictionary/data/dictionary_repo_impl.dart';
import 'package:sign_lang_app/features/dictionary/domain/usecases/fetch_dictionary_list_useCase.dart';
import 'package:sign_lang_app/features/dictionary/presentation/dictionary_view.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';
import 'package:sign_lang_app/features/home_page/home_view.dart';
import 'package:sign_lang_app/features/onboarding/onboarding_view.dart';

import 'package:sign_lang_app/features/splash/splash_view.dart';

import '../../features/auth/login/presentation/login_view.dart';
import '../../features/auth/register/register_view.dart';
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
      case Routes.homescreen:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case Routes.getVerificationCode :
        return MaterialPageRoute(builder: (_) => const GetVerificationCodeView());
      case Routes.createNewPassword :
        return MaterialPageRoute(builder: (_) => const CreateNewPasswordView());
      case Routes.bottomNavigationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FetchDictionaryListCubit(
              FetchDictionaryListUsecase(
                dictionaryRepo:
                    getIt<DictionaryRepoImpl>(), // Use GetIt to fetch the repo
              ),
            )..fetchDictionaryList(),
            child: const BottomNavigation(),
          ),
        );

      case Routes.dictionaryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FetchDictionaryListCubit(
              FetchDictionaryListUsecase(
                dictionaryRepo:
                    getIt<DictionaryRepoImpl>(), // Use GetIt to fetch the repo
              ),
            )..fetchDictionaryList(),
            child: const DictionaryView(),
          ),
        );
      default:
        return null;
    }
  }
}
