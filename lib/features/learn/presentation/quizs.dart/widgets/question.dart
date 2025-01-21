import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/avatar_sign_before_quiz_view.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Column(children: [
      SizedBox(
        height: screenHeight * 0.05,
      ),


      Image.asset("assets/images/avatar.png",
          width: screenWidth * 0.90, height: screenHeight * 0.30),

      Divider(
        color: Theme.of(context).colorScheme.onPrimary,
      ), // Colors.white,),

      Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Text(
          questionText,
          style: TextStyles.font20WhiteSemiBold
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          textAlign: TextAlign.center,
        ), 
      ) 
    ]);
  }
}
