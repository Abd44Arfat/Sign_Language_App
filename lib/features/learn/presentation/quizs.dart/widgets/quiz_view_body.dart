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

  void _resetQuiz() {
  // Use addPostFrameCallback to ensure this runs after the current frame
  WidgetsBinding.instance.addPostFrameCallback((_) {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  });
}

  void _answerQuestion(int score) {
    _totalScore += score;

    // Only update the question index after the user has answered
    setState(() {
      _questionIndex += 1;
    });
  }
final _questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': -2},
        {'text': 'IOS Development Kit', 'score': -2},
        {'text': 'Web Development Kit', 'score': -2},
        {
          'text': 'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': 10
        },
      ],
    },
    {
      'questionText': 'Q3. Which programming language is used by Flutter?',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Kotlin', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programming language?',
      'answers': [
        {'text': 'Lars Bak and Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': -2},
        {'text': 'Bjarne Stroustrup', 'score': -2},
        {'text': 'Jeremy Ashkenas', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {'text': 'Yes', 'score': -2},
        {'text': 'No', 'score': 10},
      ],
    },
  ];








  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SingleChildScrollView(
        child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: _questionIndex < _questions.length
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      questionIndex: _questionIndex,
                      questions: _questions,
                    )
                  : Result(_totalScore, _resetQuiz),
            ),
      ),
    );

    
  }
}