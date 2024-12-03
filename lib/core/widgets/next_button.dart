import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class NextButton extends StatelessWidget {
  const NextButton(
      {super.key, required this.onPressed, this.text, this.textStyle});
  final void Function()? onPressed;
  final TextStyle? textStyle;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              ColorsManager.primaryColor, // Starting color
              ColorsManager.secondaryColor, // Ending color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: 380,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          text ?? 'Next',
          style: textStyle ??
              TextStyles.font14DarkBlueMedium.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
