import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressed,
      color: ColorsManager.mediumLightBlue,
      textColor: Colors.white,
      minWidth: 380,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Text(
        'Next',
        style: TextStyles.font18WhiteSemiBold,
      ),
    );
  }
}
