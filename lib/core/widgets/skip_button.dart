import 'package:flutter/material.dart';

import '../theming/styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Skip',
            style: TextStyles.font14DarkBlueMedium,
          ),
        ),
      ],
    );
  }
}
