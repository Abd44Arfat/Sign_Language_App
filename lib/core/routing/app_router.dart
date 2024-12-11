import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:sign_lang_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/reset_password_view.dart';
import 'package:sign_lang_app/features/categories/domain/usecase/fetch_categories_usecase.dart';
import 'package:sign_lang_app/features/categories/presentation/manager/cubit/categories_cubit.dart';

import 'package:sign_lang_app/features/dictionary/data/dictionary_repo_impl.dart';
import 'package:sign_lang_app/features/dictionary/domain/usecases/fetch_dictionary_list_useCase.dart';
import 'package:sign_lang_app/features/dictionary/presentation/dictionary_details_view.dart';
import 'package:sign_lang_app/features/dictionary/presentation/dictionary_view.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';
import 'package:sign_lang_app/features/categories/categories_view.dart';
import 'package:sign_lang_app/features/learn/domain/usecase/fetch_question_usecase.dart';
import 'package:sign_lang_app/features/learn/domain/usecase/sign_before_quiz_usecase.dart';
import 'package:sign_lang_app/features/learn/presentation/guidebook/guide_book_view.dart';
import 'package:sign_lang_app/features/learn/presentation/learn_instructions_lets_start_view.dart';
import 'package:sign_lang_app/features/learn/presentation/learn_instructions_welcome_msg_view.dart';

import 'package:sign_lang_app/features/home_page/home_view.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/fetch_avatar_signbefore_quiz_cubit/fetch_avatar_signbefore_quiz_cubit.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/fetch_question_cubit.dart/fetch_question_cubit.dart';
import 'package:sign_lang_app/features/levels/domain/usecase/fetch_levels_usecase.dart';
import 'package:sign_lang_app/features/levels/presentation/levels_view.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/score_tracker_cubit/score_tracker_cubit.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/avatar_sign_before_quiz_view.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/quiz_view.dart';
import 'package:sign_lang_app/features/levels/presentation/manager/levels_cubit.dart';
import 'package:sign_lang_app/features/onboarding/onboarding_view.dart';

import '../../features/auth/presentation/login_view.dart';
import '../../features/auth/presentation/register_view.dart';
import '../../features/bottom_nav/button_navigation.dart';
import '../../features/learn/presentation/achievements_view.dart';
import '../../features/setting/presentation/Edit_info_cubit/edit_info_cubit.dart';
import '../../features/setting/presentation/views/about_us_view.dart';
import '../../features/setting/presentation/views/edit_info_view.dart';
import '../../features/setting/presentation/views/saved_words.dart';
import '../../features/setting/presentation/views/setting_view.dart';
import '../../features/splash/splash_view.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.SettingView:
        return MaterialPageRoute(
          builder: (_) => const SettingView(),
        );

      case Routes.DictionaryDetailsView:
        return MaterialPageRoute(
          builder: (_) => const DictionaryDetailsView(),
        );

      case Routes.editInfoview:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => EditInfoCubit(DioClient()),
            child: const EditInfoView(),
          ),
        );

      case Routes.SavedWordsScreen:
        return MaterialPageRoute(
          builder: (_) => const SavedWordsScreen(),
        );

      case Routes.CategoriesView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                CategoriesCubit(getIt<FetchCategoriesListUsecase>()),
            child: const CategoriesView(),
          ),
        );

      /*case Routes.LevelsView:
        return MaterialPageRoute(
          builder: (_) => LevelsView(),
        ); */

      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.homescreen:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.aboutUsView:
        return MaterialPageRoute(
          builder: (_) => const AboutUsView(),
        );

      case Routes.Guidebook:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FetchAvatarSignbeforeQuizCubit( getIt<AvatarBeforeQuizUsecase>()),
            child: const GuideBookView(),
          ),
        );

 case Routes.signbeforeQuiz:
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (context) => FetchAvatarSignbeforeQuizCubit(
          getIt<AvatarBeforeQuizUsecase>()),
      child: AvatarSignBeforeQuizView(levelId: settings.arguments as String), // Pass levelId here
    ),
  );

      case Routes.quiz:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ScoreTrackerCubit(totalQuestions: 6),
              ),
              BlocProvider(
                create: (context) => FetchQuestionCubit(
                  fetchQuestionListUsecase: getIt<
                      FetchQuestionListUsecase>(), // Ensure the parameter name matches
                ),
              ),
            ],
            child: const QuizView(),
          ),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignupCubit(),
                  child: const RegisterView(),
                ));
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(dioClient: DioClient()),
                  child: const LoginView(),
                ));
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());

      case Routes.learnInstructionsLetsStartView:
        return MaterialPageRoute(
            builder: (_) => const LearnInstructionsLetsStartView());

      case Routes.learnInstructionsWelcomeMsgView:
        return MaterialPageRoute(
            builder: (builder) => const LearnInstructionsWelcomeMsgView());

      case Routes.LevelsView:
        final arguments = settings.arguments
            as Map<String, dynamic>?; // Safely cast arguments
        final String categoryId = arguments?['categoryId'];
        /* final String categoryId =
            settings.arguments['categoryId'] ?? "" ; */ // Extract the argument
        return MaterialPageRoute(
          builder: (builder) => BlocProvider(
            create: (context) => LevelsCubit(
              getIt<FetchLevelsUsecase>(),
            )..fetchLevels(
                categoryId), // Call a method to fetch levels for the new category
            child: LevelsView(), // Pass the categoryId to the view
          ),
          settings: settings,
        );

      /*case Routes.LevelsView:
        final String categoryId =
            settings.arguments.toString() as String; // Extract the argument
        return MaterialPageRoute(
          builder: (builder) => BlocProvider(
            create: (context) => LevelsCubit(
              getIt<FetchLevelsUsecase>(),
            )..fetchLevels(
                categoryId), // Call a method to fetch levels for the new category
            child: LevelsView(), // Pass the categoryId to the view
          ),
          settings: settings,
        ); */
      /*return MaterialPageRoute(
            builder: (builder) => BlocProvider(
                  create: (context) => getIt<LevelsCubit>(),
                  //context.read<FetchLevelsUsecase>()),
                  //getIt<LevelsCubit>(),
                  child: const LevelsView(),
                ),
            settings: settings);*/
      //  case Routes.bottomNavigation:
      //   if (arguments is Map<String, String>) {
      //     final userName = arguments['userName'];
      //     final userEmail = arguments['userEmail'];
      //     return MaterialPageRoute(
      //       builder: (_) => BottomNavigation(
      //         userName: userName ?? '',
      //         userEmail: userEmail ?? '',
      //       ),
      //     );
      //   }
      case Routes.AchievementsView:
        return MaterialPageRoute(builder: (_) => const AchievementsView());

      case Routes.bottomNavigation:
        return MaterialPageRoute(
          builder: (_) => const BottomNavigation(
            userName: '',
            userEmail: '',
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
