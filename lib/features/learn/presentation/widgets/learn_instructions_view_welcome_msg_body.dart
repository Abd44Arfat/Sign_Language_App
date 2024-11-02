import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/core/widgets/next_button.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/continue_button.dart';

import '../../../../core/routing/routes.dart';
import 'nova_message.dart';
class LearnInstructionsWelcomeMsgViewBody extends StatelessWidget {
  const LearnInstructionsWelcomeMsgViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.28,),
        SizedBox(
          height: screenHeight * 0.07,
          width: screenWidth,
          child: Row( children:
          [
            SizedBox(width: screenWidth * 0.50),
            const NovaMessage(text: 'Hi there! i\'m Nova',), ],
          ) ,
        ),
        Image.asset("assets/images/avatar.png" , width: screenWidth *0.90 , height: screenHeight * 0.44,),
        //SizedBox(height: screenHeight * 0.05,),
         ContinueButton(text: 'Continue',onPressed: () {
          context.pushNamed(Routes.learnInstructionsLetsStartView);
        },),

      ],
    );
  }
}
