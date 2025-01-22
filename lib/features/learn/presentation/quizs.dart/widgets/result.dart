import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/continue_button.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {super.key});

  String get resultPhrase {
    if (resultScore <= 10) {
      return 'failed';
    } else if (resultScore <= 20) {
      return 'Pretty likeable!';
    } else if (resultScore <= 30) {
      return 'You are strange!';
    } else {
      return 'ou did it!';
    }
  }

  String get animationPath {
    if (resultScore <= 8) {
      return 'assets/animations/fail.json';
    } else if (resultScore <= 12) {
      return 'assets/animations/fail.json';
    } else if (resultScore <= 16) {
      return 'assets/animations/check_hand.json';
    } else {
      return 'assets/animations/bird_success.json'; // Adjust as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 400.h, // Increased height
              width: 400.w, // Increased width
              child: Lottie.asset(
                animationPath, // Use the selected animation
                fit: BoxFit.contain, // Maintain aspect ratio
              ),
            ),
          ),
          Text(
            resultPhrase,
            style: TextStyles.font20WhiteSemiBold
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            textAlign: TextAlign.center,
          ),
          Text(
            'Score: $resultScore',
            style: TextStyles.font24WhiteBold
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(height: 20), // Add some spacing
          ContinueButton(text: 'Restart Quiz!', onPressed: resetHandler),
        ],
      ),
    );
  }
}
