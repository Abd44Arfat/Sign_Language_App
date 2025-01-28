import 'package:flutter/material.dart';

import '../../../../core/widgets/next_button.dart';
class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key , this.onPressed , required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return NextButton(

      onPressed: onPressed , text: text, textStyle: const TextStyle(fontSize: 22 , fontWeight: FontWeight.w600 , color: Colors.black87), );
  }
}
