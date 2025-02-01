import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/avatar_with_txt.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/continue_button.dart';

class Achievement2 extends StatelessWidget {
  const Achievement2({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: screenHeight * 0.07,
          ),
          AvatarWithTxt(
              imagePath:
                  "assets/images/static_pointing_fingers.png", // "assets/images/static_point_up1.png",
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              text:
                  'After starting a test,a sign language representation appears, followed by related questions.'),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const Expanded(child: SizedBox()),
          ContinueButton(
              text: "Start a Test",
              onPressed: () async {
                context.pushNamed(Routes.CategoriesView);

                await SharedPrefHelper.setData(
                    SharedPrefKeys.weclometestcomplete, true);
              }),
          SizedBox(
            height: screenHeight * 0.10,
          )
        ],
      ),
    ));
  }
}
