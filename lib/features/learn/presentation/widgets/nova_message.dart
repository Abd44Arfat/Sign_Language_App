import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:flutter/material.dart';
class NovaMessage extends StatelessWidget {
  const NovaMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialTwo(
      text:  'Hi there! i\'m Nova' , isSender: false,color: Colors.green[200]!, textStyle: const TextStyle(color: Colors.black87 , fontSize: 20),);
  }
}
