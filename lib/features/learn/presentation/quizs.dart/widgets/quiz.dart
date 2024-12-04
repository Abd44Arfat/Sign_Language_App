import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/score_tracker_cubit/score_tracker_cubit.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/widgets/answer.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/continue_button.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/questions_tracker.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Update the score tracker with the current question index
    context.read<ScoreTrackerCubit>().emit(questionIndex + 1); // Increment to match user-friendly indexing

    return Column(
      children: [
        Row(
          children: [
             IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.grey[200],
                )),
            QuestionsTracker(totalQ: questions.length+1),
          ],
        ), // Add the QuestionsTracker here
        Question(
          questions[questionIndex]['questionText'].toString(),
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            () => answerQuestion(answer['score']),
            answer['text'].toString(),
          );
        }).toList(),
    
 
      ],
    );
  }
}