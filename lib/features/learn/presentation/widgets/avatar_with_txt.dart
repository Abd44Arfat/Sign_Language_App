import 'package:flutter/material.dart';

import 'nova_message.dart';

class AvatarWithTxt extends StatelessWidget {
  const AvatarWithTxt({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.text,
    required this.imagePath,
  });
  final String imagePath;
  final String text;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth * 0.05,
        ),
        Image.asset(imagePath,
            fit: BoxFit.fitHeight,
            width: screenWidth * 0.47, //* 0.3,
            height: screenHeight * 0.25 // *0.20,
            ),
        Expanded(
          child: NovaMessage(
            text: text,
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
