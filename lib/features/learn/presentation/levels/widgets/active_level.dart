import 'package:chiclet/chiclet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ActiveLevel extends StatelessWidget {
  final String item;
  final Color backgroundColor; 
    final Color borderColor; 
  // New parameter for background color

  ActiveLevel({required this.item, required this.backgroundColor, required this.borderColor}); // Constructor updated

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background color container
    
        // Circular progress indicator
        SizedBox(
          width: 110,
          height: 110,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            value: 0.3,
            backgroundColor: Color(0xffE5E5E5),
            valueColor: AlwaysStoppedAnimation<Color>(backgroundColor),
          ),
        ),
        // Animated button
        ChicletOutlinedAnimatedButton(
          onPressed: () {
            // Action when button is pressed
          },
          height: 70,
          width: 80,
          buttonHeight: 8,
          backgroundColor:backgroundColor , // Keep button background transparent
          borderColor: borderColor,
          buttonType: ChicletButtonTypes.oval,
          child: SvgPicture.asset('assets/images/level_icon.svg'),
        ),
      ],
    );
  }
}