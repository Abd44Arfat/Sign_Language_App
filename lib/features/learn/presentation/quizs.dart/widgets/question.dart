import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/constants.dart';

class Question extends StatelessWidget {
  final String questionText;
  final String gifLink;

  const Question(this.questionText, this.gifLink, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.05,
        ),

        Image.network(
          ApiUrls.baseURL + gifLink,
          width: screenWidth * 0.90,
          height: screenHeight * 0.40,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: screenWidth * 0.90,
              height: screenHeight * 0.30,
              color: Colors.grey, // Placeholder color
              child: const Center(child: Text('Image not available')),
            );
          },
        ),
// Text(
//   gifLink,
//   style: TextStyles.font14DarkBlueMedium,
// ),
        Divider(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: Text(
            questionText,
            style: TextStyles.font20WhiteSemiBold.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
