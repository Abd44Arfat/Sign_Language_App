import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/score_tracker_cubit/score_tracker_cubit.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/widgets/answer.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/continue_button.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/questions_tracker.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Questions> questions;
  final int questionIndex;
  final Function(int, int) answerQuestion;
  final int? selectedAnswerIndex;
  final bool showFeedback;
  final VoidCallback onNextQuestion;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
    required this.selectedAnswerIndex,
    required this.showFeedback,
    required this.onNextQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    final answers = currentQuestion.options;

    final correctAnswerIndex =
        answers.indexWhere((answer) => answer.score == 10);
    context.read<ScoreTrackerCubit>().emit(questionIndex + 1);

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
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer, // Colors.grey[200],
                )),
            QuestionsTracker(totalQ: questions.length + 1),
          ],
        ),
        Question(currentQuestion.question),
        ...answers.asMap().entries.map((entry) {
          final idx = entry.key;
          final answer = entry.value;
          final isCorrect = idx == correctAnswerIndex;
          final isSelected = idx == selectedAnswerIndex;

          Color backgroundColor = Colors.transparent;
          if (showFeedback) {
            if (isSelected)
              backgroundColor = isCorrect ? Colors.green : Colors.red;
            if (isCorrect && !isSelected) backgroundColor = Colors.green;
          }

          return Answer(
            () => answerQuestion(answer.score, idx),
            answer.text,
            backgroundColor: backgroundColor,
          );
        }).toList(),
        if (showFeedback)
          ContinueButton(text: 'Continue', onPressed: onNextQuestion),
      ],
    );
  }
}
