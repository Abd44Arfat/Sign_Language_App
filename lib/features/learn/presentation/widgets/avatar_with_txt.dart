import 'package:flutter/material.dart';

import 'nova_message.dart';
class AvatarWithTxt extends StatelessWidget {
  const AvatarWithTxt({
    super.key,
    required this.screenWidth,
    required this.screenHeight, required this.text,
  });
  final String text;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: screenWidth * 0.05 ,),
        Image.asset("assets/images/avatar.png" , width: screenWidth *0.3, height: screenHeight * 0.20, ),
        NovaMessage(text: text , fontSize: 14,)

      ],);
  }
}