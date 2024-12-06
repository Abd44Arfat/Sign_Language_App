import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/widgets/quiz.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/widgets/result.dart';

class QuizViewBody extends StatefulWidget {
  const QuizViewBody({super.key});

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  var _questionIndex = 0;
  var _totalScore = 0;
  int? _selectedAnswerIndex; // To track the selected answer
  bool _showFeedback = false; // Whether to show feedback or not

  void _answerQuestion(int score, int answerIndex) {
    setState(() {
      _selectedAnswerIndex = answerIndex;
      _showFeedback = true;

      if (score == 10) {
        _totalScore += score; // Update score only for correct answers
      }
    });
  }

  void _goToNextQuestion() {
    setState(() {
      _selectedAnswerIndex = null;
      _showFeedback = false;
      _questionIndex += 1; // Move to the next question
    });
  }

 void _resetQuiz() {
  // Use addPostFrameCallback to ensure this runs after the current frame
  WidgetsBinding.instance.addPostFrameCallback((_) {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  });
}

final _questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': 0},
        {'text': 'Adobe', 'score': 0},
        {'text': 'Google', 'score': 10},

      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': 0},
        {'text': 'IOS Development Kit', 'score': 0},

        {
          'text': 'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': 10
        },
      ],
    },
    {
      'questionText': 'Q3. Which programming language is used by Flutter?',
      'answers': [
        {'text': 'Ruby', 'score': 0},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': 0},
    
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programming language?',
      'answers': [
        {'text': 'Lars Bak and Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': 0},
        {'text': 'Bjarne Stroustrup', 'score': 0},
     
      ],
    },
    {
      'questionText': 'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {'text': 'Yes', 'score': 0},
        {'text': 'No', 'score': 10},
      ],
    },
  ];







 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: (score, index) => _answerQuestion(score, index),
                  questionIndex: _questionIndex,
                  questions: _questions,
                  selectedAnswerIndex: _selectedAnswerIndex,
                  showFeedback: _showFeedback,
                  onNextQuestion: _goToNextQuestion,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}