import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import 'avatar_with_txt.dart';
import 'continue_button.dart';
import 'custom_listile.dart';
import 'nova_message.dart';
class Achievement1 extends StatelessWidget {
  Achievement1( {super.key, this.onPressed  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
            AvatarWithTxt(screenWidth: screenWidth , screenHeight: screenHeight , text: "Here's what you can achieve!", ),
            const Divider(color: Colors.white  ,),
            const CustomListile(imageUrl: 'assets/images/conversation.png', title: 'Converse with confidence', subtitle: '50 stress-free interactive exercises'),
            const Divider(color: Colors.white  ,),
            const CustomListile(imageUrl:  'assets/images/a.png', title: 'Build a large vocabulary', subtitle: '2000+ practical words and phases'),
            const Divider(color: Colors.white  ,),
            const CustomListile(imageUrl: 'assets/images/watch.png', title: 'Develop a learning habit', subtitle: 'Smart reminders, fun challenges, and more'),
            SizedBox(height: screenHeight * 0.10,),
            ContinueButton(text: "Continue" , onPressed: onPressed, )

          ]),
    );
  }
}