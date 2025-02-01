import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/side_avatar.dart';
import '../../../../core/routing/routes.dart';
import 'continue_button.dart';
import 'nova_message.dart';

class LearnInstructionsLetsStartViewBody extends StatelessWidget {
  const LearnInstructionsLetsStartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.28,
        ),
        SizedBox(
          height: screenHeight * 0.07,
          width: screenWidth,
          child: Row(
            children: [
              SizedBox(width: screenWidth * 0.4),
              const NovaMessage(
                text: 'let\'s get started! ',
              ),
            ],
          ),
        ),
        SideAvatar(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          imagePath: "assets/images/static_point_up1.png",
        ),
        ContinueButton(
          text: 'Continue',
          onPressed: () {
            //Navigator.pushReplacementNamed(context, Routes.AchievementsView);
            Navigator.pushNamed(context, Routes.AchievementsView);
          },
        ),
        SizedBox(
          height: screenHeight * 0.15,
        )
      ],
    );
  }
}
