import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/continue_button.dart';

class AvatarSignBeforeQuizView extends StatelessWidget {
  const AvatarSignBeforeQuizView({super.key});

  @override
  Widget build(BuildContext context) {
  double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: CustomStack(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.20,),
  

CustomRefreshBtn(),

            Image.asset("assets/images/avatar.png" , width: screenWidth *0.90 , height: screenHeight * 0.44,),
            //SizedBox(height: screenHeight * 0.05,),
     SignName(name: 'How Are You',),
        Spacer(),
  ContinueButton(text: 'Ok , I Get it',onPressed: () {
          context.pushNamed(Routes.learnInstructionsLetsStartView);
        },),
        SizedBox(height: screenHeight * 0.05,),

          ],
        ),
      ),
    );
  }
}

class SignName extends StatelessWidget {
  const SignName({
    super.key, required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 60.h,
    width: 200.w,
    decoration:BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(width: 2, color: Colors.white,) ,
    color: Colors.transparent
    
    ),
    child: Center(child: Text(name,style:TextStyles.font20WhiteSemiBold )),
    );
  }
}

class CustomRefreshBtn extends StatelessWidget {
  const CustomRefreshBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(height: 50.h,
        width: 60.h,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color(0xffCCA000)),
          color: Color(0xffFFC800),
         borderRadius: BorderRadius.circular(10), 
        ),
        child: Center(child: SvgPicture.asset('assets/images/refresh.svg',)),
        ),
      ),
    );
  }
}
