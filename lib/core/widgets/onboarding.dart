import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class Onboarding extends StatelessWidget {
  const Onboarding(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subTitle});
  final String imageUrl, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(imageUrl, width: double.infinity)),
        Text(
          title,
          style: TextStyles.font24PrimarySemibold,
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
            width: 340,
            child: Text(
              subTitle,
              style: TextStyles.font17WhiteMedium,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
