import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/learn/domain/usecase/fetch_question_usecase.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/fetch_question_cubit.dart/fetch_question_cubit.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/score_tracker_cubit/score_tracker_cubit.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  final String levelId; // Add levelId parameter

  const QuizView({super.key, required this.levelId}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScoreTrackerCubit(totalQuestions: 6),
        ),
        BlocProvider(
          create: (context) => FetchQuestionCubit(
            fetchQuestionListUsecase: getIt<FetchQuestionListUsecase>(),
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryFixed,
        //backgroundColor: const Color(0xff141F23),
        body: CustomStack(
            child:
                QuizViewBody(levelId: levelId)), // Pass levelId to QuizViewBody
      ),
    );
  }
}
