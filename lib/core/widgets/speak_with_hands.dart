import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class SpeakWithHands extends StatelessWidget {
  const SpeakWithHands({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 20,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          //padding: const EdgeInsets.only(top: 20),
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SvgPicture.asset(
                  "assets/images/Rectangle 2493.svg",
                  // ignore: deprecated_member_use
                  fit: BoxFit.fill,
                  width: MediaQuery.sizeOf(context).width,
                ),
              ),
              // ignore: prefer_const_constructors
              Positioned(
                top: -1,
                right: 1,
                left: 200,
                bottom: 0,
                child: Image.asset(
                  "assets/images/onboarding3.png",
                ),
              ),

              Positioned(
                left: 20,
                top: 50,
                bottom: 10,
                child: Text(
                  'Speak With\nYour Hands',
                  style: TextStyles.font18WhiteSemiBold
                      .copyWith(fontWeight: FontWeight.w800, fontSize: 28),
                ),
              )

              /*Text(
                'Speak With\n Your Hands',
                style: TextStyles.font18WhiteSemiBold
                    .copyWith(fontWeight: FontWeight.w900),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}



/*
class SpeakWithHands extends StatelessWidget {
  const SpeakWithHands({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: SvgPicture.asset("assets/images/frame.svg"),
              //image: AssetImage('assets/images/speak_with_hands.png'),
            ),
          ),
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
 */