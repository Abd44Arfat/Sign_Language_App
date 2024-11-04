import 'package:chiclet/chiclet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ActiveLevel extends StatelessWidget {
  final String item;

  ActiveLevel({required this.item,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 110,
          height: 110,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            value: 0.3,
            backgroundColor: Color(0xffE5E5E5),
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFFC800)),
          ),
        ),
        ChicletOutlinedAnimatedButton(
          onPressed: (){


            
          },
          
          
          height: 70,
          width: 80,
          buttonHeight: 8,
          backgroundColor: Color(0xff58CC02),
          borderColor: Color(0xff46A302),
          buttonType: ChicletButtonTypes.oval,
          child: SvgPicture.asset('assets/images/level_icon.svg'),
        ),
      
      ],
    );
  }
}