import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeakWithHands extends StatelessWidget {
  const SpeakWithHands({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/speak_with_hands.png'),
                  fit: BoxFit.fill)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                const Text(
                  'Speak with ',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                RichText(
                    text: const TextSpan(
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(text: 'your '),
                    TextSpan(
                      text: 'hands',
                      style: TextStyle(
                        backgroundColor: Colors
                            .green, // Highlight background color for "hands"
                        color: Colors.white, // Text color for "hands"
                      ),
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
