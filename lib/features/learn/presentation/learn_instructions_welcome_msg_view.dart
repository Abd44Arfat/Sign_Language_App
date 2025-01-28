import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/learn_instructions_view_welcome_msg_body.dart';

class LearnInstructionsWelcomeMsgView extends StatelessWidget {
  const LearnInstructionsWelcomeMsgView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomStack(
            width: double.minPositive, child: LearnInstructionsWelcomeMsgViewBody()));
  }
}
