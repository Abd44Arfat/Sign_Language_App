import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/animations/page_nav_animation.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:sign_lang_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/reset_password_view.dart';
import 'package:sign_lang_app/features/categories/domain/usecase/fetch_categories_usecase.dart';
import 'package:sign_lang_app/features/categories/presentation/manager/cubit/categories_cubit.dart';
import 'package:sign_lang_app/features/change_password/change_password_view.dart';
import 'package:sign_lang_app/features/change_password/presentation/manager/change_password_cubit.dart';
import 'package:sign_lang_app/features/common_words/presentation/common_words_view.dart';

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

bool isIos(BuildContext context) {
  return Theme.of(context).platform == TargetPlatform.iOS;
}

bool isAndroid(BuildContext context) {
  return Theme.of(context).platform == TargetPlatform.android;
}

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.SettingView:
        return MaterialPageRoute(builder: (_) => const SettingView());

      case Routes.DictionaryDetailsView:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (_) => const DictionaryDetailsView());
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: const DictionaryDetailsView());
        }

      case Routes.editInfoview:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => EditInfoCubit(DioClient()),
                    child: const EditInfoView(),
                  ),
              settings: settings);
        } else {
          return PageNavAnimation.applyPageAnimation(
              settings: settings,
              screen: BlocProvider(
                create: (context) => EditInfoCubit(DioClient()),
                child: const EditInfoView(),
              ));
        }

      /* PageNavAnimation.applyPageAnimation(
            screen: BlocProvider(
          create: (context) => EditInfoCubit(DioClient()),
          child: const EditInfoView(),
        ));*/

      case Routes.SavedWordsScreen:
        if (Platform.isIOS) {
          return CupertinoPageRoute(builder: (_) => const SavedWordsScreen());
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: const SavedWordsScreen());
        }

      case Routes.CategoriesView:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) =>
                        CategoriesCubit(getIt<FetchCategoriesListUsecase>()),
                    child: const CategoriesView(),
                  ));
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: BlocProvider(
            create: (context) =>
                CategoriesCubit(getIt<FetchCategoriesListUsecase>()),
            child: const CategoriesView(),
          ));
        }

      /*case Routes.LevelsView:
        return MaterialPageRoute(
          builder: (_) => LevelsView(),
        ); */

      case Routes.splashScreen:
        return PageNavAnimation.applyPageAnimation(screen: const SplashView());
      case Routes.homescreen:
        return MaterialPageRoute(builder: (_) => const HomeView());
      //return PageNavAnimation.applyPageAnimation(screen: const HomeView());
      case Routes.aboutUsView:
        if (Platform.isIOS) {
          return CupertinoPageRoute(builder: (_) => const AboutUsView());
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: const AboutUsView());
        }

      case Routes.Guidebook:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (builder) => BlocProvider(
                    create: (context) => FetchAvatarSignbeforeQuizCubit(
                        getIt<AvatarBeforeQuizUsecase>()),
                    child: const GuideBookView(),
                  ));
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: BlocProvider(
            create: (context) => FetchAvatarSignbeforeQuizCubit(
                getIt<AvatarBeforeQuizUsecase>()),
            child: const GuideBookView(),
          ));
        }
      case Routes.quiz:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
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
              child: QuizView(levelId: settings.arguments as String),
            ),
          );
        } else {
          return PageNavAnimation.applyPageAnimation(
            screen: MultiBlocProvider(
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
              child: QuizView(levelId: settings.arguments as String),
            ),
          );
        }

      case Routes.registerScreen:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (builder) => BlocProvider(
                    create: (context) => SignupCubit(),
                    child: const RegisterView(),
                  ));
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: BlocProvider(
            create: (context) => SignupCubit(),
            child: const RegisterView(),
          ));
        }

      case Routes.loginScreen:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (builder) => BlocProvider(
                    create: (context) => LoginCubit(dioClient: DioClient()),
                    child: const LoginView(),
                  ));
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: BlocProvider(
            create: (context) => LoginCubit(dioClient: DioClient()),
            child: const LoginView(),
          ));
        }
      case Routes.resetPassword:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (builder) => const ResetPasswordView());
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: const ResetPasswordView());
        }

      case Routes.changePassword:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (builder) => BlocProvider(
                    create: (context) => ChangePasswordCubit(
                      dioClient: DioClient(),
                    ),
                    child: const ChangePasswordView(),
                  ),
              settings: settings);
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: BlocProvider(
                create: (context) => ChangePasswordCubit(
                  dioClient: DioClient(),
                ),
                child: const ChangePasswordView(),
              ),
              settings: settings);
        }
      case Routes.learnInstructionsLetsStartView:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (_) => const LearnInstructionsLetsStartView());
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: const LearnInstructionsLetsStartView());
        }

      case Routes.learnInstructionsWelcomeMsgView:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (_) => const LearnInstructionsWelcomeMsgView());
        } else {
          return PageNavAnimation.applyPageAnimation(
              screen: const LearnInstructionsWelcomeMsgView());
        }

      /*case Routes.LevelsView:
        final arguments = settings.arguments
            as Map<String, dynamic>?; // Safely cast arguments
        final String categoryId = arguments?['categoryId'];
        return MaterialPageRoute(
          builder: (builder) => BlocProvider(
            create: (context) => LevelsCubit(
              getIt<FetchLevelsUsecase>(),
            )..fetchLevels(
                categoryId), // Call a method to fetch levels for the new category
            child: LevelsView(), // Pass the categoryId to the view
          ),
          settings: settings,
        );*/

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
            child: const LevelsView(), // Pass the categoryId to the view
          ),
          settings: settings,
        );
      /* Platform.isIOS
            ? CupertinoPageRoute(
                settings: settings,
                builder: (builder) => BlocProvider(
                  create: (context) => LevelsCubit(
                    getIt<FetchLevelsUsecase>(),
                  )..fetchLevels(
                      categoryId), // Call a method to fetch levels for the new category
                  child: LevelsView(), // Pass the categoryId to the view
                ),
              )
            :*/
      /*return PageNavAnimation.applyPageAnimation(
          screen: BlocProvider(
            create: (context) => LevelsCubit(
              getIt<FetchLevelsUsecase>(),
            )..fetchLevels(
                categoryId), // Call a method to fetch levels for the new category
            child: LevelsView(), // Pass the categoryId to the view
          ),
          settings: settings,
        );*/

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
        if (Platform.isIOS) {
          return CupertinoPageRoute(builder: (_) => const AchievementsView());
        } else {
          return MaterialPageRoute(builder: (_) => const AchievementsView());
        }

      case Routes.bottomNavigation:
        return MaterialPageRoute(
          builder: (_) => const BottomNavigation(
            userName: '',
            userEmail: '',
          ),
        );

      case Routes.dictionaryScreen:
        if (Platform.isIOS) {
          return CupertinoPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => FetchDictionaryListCubit(
                      FetchDictionaryListUsecase(
                        dictionaryRepo: getIt<
                            DictionaryRepoImpl>(), // Use GetIt to fetch the repo
                      ),
                    )..fetchDictionaryList(),
                    child: const DictionaryView(),
                  ),
              settings: settings);
        } else {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => FetchDictionaryListCubit(
                      FetchDictionaryListUsecase(
                        dictionaryRepo: getIt<
                            DictionaryRepoImpl>(), // Use GetIt to fetch the repo
                      ),
                    )..fetchDictionaryList(),
                    child: const DictionaryView(),
                  ),
              settings: settings);
        }
      case Routes.commonWordsScreen:
        return MaterialPageRoute(
            builder: (_) => const CommonWordsView(), settings: settings);

      /*case Routes.commonWordsScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              CommonWordsView(
            key: UniqueKey(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: Offstage(
                offstage: animation.value == 0,
                child: child,
              ),
            );
          },
        );*/

      default:
        return null;
    }
    return null;
  }
}
