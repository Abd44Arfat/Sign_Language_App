import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/score_tracker_cubit/score_tracker_cubit.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/widgets/answer.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/continue_button.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/questions_tracker.dart';
import './question.dart';
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(int, int) answerQuestion; // Pass index and score
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
    final answers = questions[questionIndex]['answers'] as List<Map<String, Object>>;
    final correctAnswerIndex = answers.indexWhere((answer) => answer['score'] == 10);
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



        Question(questions[questionIndex]['questionText'].toString()),
        ...answers.asMap().entries.map((entry) {
          final idx = entry.key;
          final answer = entry.value;
          final isCorrect = idx == correctAnswerIndex;
          final isSelected = idx == selectedAnswerIndex;

          Color backgroundColor = Colors.transparent;
          if (showFeedback) {
            if (isSelected) backgroundColor = isCorrect ? Colors.green : Colors.red;
            if (isCorrect && !isSelected) backgroundColor = Colors.green;
          }

          return Answer(
            () => answerQuestion(answer['score'] as int, idx),
            answer['text'].toString(),
            backgroundColor: backgroundColor,
          );
        }).toList(),
        if (showFeedback)
      ContinueButton(text: 'Countinue', onPressed:onNextQuestion),
      ],
    );
  }
}