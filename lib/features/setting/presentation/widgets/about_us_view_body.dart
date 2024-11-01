import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import 'about_us_main_features.dart';
class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        //shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          Center(
            child: Text('Sign Talk App' , style: TextStyles.font28GreenSemiBold ,)
          ),
          SizedBox(height: 10,),
          Text('Welcome to Sign Talk, an innovative app designed to bridge the communication gap between sign language users and the hearing community. Our app utilizes advanced technology to translate sign language gestures into spoken language, making communication accessible and efficient for everyone.',
           style: TextStyles.font18WhiteMedium.copyWith(fontSize: 24) ,
          ),
          SizedBox(height: 20,),
          Text('App Main Features:' , style: TextStyles.font28GreenSemiBold ),
          SizedBox(height: 7,),
          const AboutUsMainFeatures()
        ],
      ),
    );
  }


}
