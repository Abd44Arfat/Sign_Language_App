import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/fetch_question_cubit.dart/fetch_question_cubit.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/widgets/quiz.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/widgets/result.dart';

class QuizViewBody extends StatefulWidget {
  const QuizViewBody({super.key, required this.levelId});
  final String levelId; // Store the levelId

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  var _questionIndex = 0;
  var _totalScore = 0;
  int? _selectedAnswerIndex; 
  bool _showFeedback = false; 

  @override
  void initState() {
    super.initState();
    context.read<FetchQuestionCubit>().fetchDictionaryList(widget.levelId);
  }

  void _answerQuestion(int score, int answerIndex) {
    setState(() {
      _selectedAnswerIndex = answerIndex;
      _showFeedback = true;

      if (score == 10) {
        _totalScore += score; 
      }
    });
  }

  void _goToNextQuestion() {
    setState(() {
      _selectedAnswerIndex = null;
      _showFeedback = false;
      _questionIndex += 1; 
    });
  }

  void _resetQuiz() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _questionIndex = 0;
        _totalScore = 0;
      });
    });
  }

  @override
  @override
Widget build(BuildContext context) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: BlocBuilder<FetchQuestionCubit, FetchQuestionState>(
          builder: (context, state) {
            if (state is FetchQuestionLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FetchQuestionFailure) {
              return Center(child: Text('Error: ${state.errmessage}'));
            } else if (state is FetchQuestionSuccess) {
              final questions = state.questions;

              return _questionIndex < questions.length
                  ? Quiz(
                      answerQuestion: (score, index) => _answerQuestion(score, index),
                      questionIndex: _questionIndex,
                      questions: questions,
                      selectedAnswerIndex: _selectedAnswerIndex,
                      showFeedback: _showFeedback,
                      onNextQuestion: _goToNextQuestion,
                    )
                  : Result(_totalScore, _resetQuiz);
            }
            return Container(); 
          },
        ),
      ),
    ),
  );
}}