import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
backgroundColor: Color(0xff141F23),

body:  CustomStack(child: QuizViewBody()),

    );
  }
}