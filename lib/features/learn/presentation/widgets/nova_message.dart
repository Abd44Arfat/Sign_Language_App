import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
class NovaMessage extends StatefulWidget {
  const NovaMessage({super.key, required this.text, this.fontSize});
   final String text ;
   final double? fontSize;
  @override
  State<NovaMessage> createState() => _NovaMessageState();
}

class _NovaMessageState extends State<NovaMessage> {

  @override
  Widget build(BuildContext context) {
   return TypeWriter(
        controller: TypeWriterController(text: widget.text , duration: const Duration(milliseconds: 50)),
        builder: (context, value) {
          return BubbleSpecialTwo(
            constraints: const BoxConstraints(maxWidth: 200),
            text:  value.text , isSender: false , color: Colors.green[200]!, textStyle: TextStyle(color: Colors.black87 , fontSize: widget.fontSize ?? 20 ,),);

        }
    );

  }
}
