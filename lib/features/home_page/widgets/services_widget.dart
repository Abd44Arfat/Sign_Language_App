import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/features/home_page/widgets/start_now_btn.dart';
import 'package:sign_lang_app/main.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Use Expanded to take available space
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 227.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    ColorsManager.secondaryColor, // Top color
                    ColorsManager.primaryColor, // Bottom color
                  ],
                  stops: [0.2, 0.8],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      child: CircleAvatar(
                        backgroundColor: ColorsManager.lightGray.withOpacity(0.3),
                        child: SvgPicture.asset(
                          'assets/images/ai_icon.svg',
                        ),
                      ),
                    ),
                    Text(
                      'Real-time \nCommunication\nwith feedback',
                      style: TextStyles.font16WhiteMedium
                          .copyWith(color: Colors.black),
                    ),
                    StartNowBtn(
                      buttonText: 'Start Now',
                      textStyle: TextStyles.font15BlackMedium,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Use Expanded for the vertical column of services
        Expanded(
          child: Column(
            children: [
              ServicesHorizontalWidget(
                background: ColorsManager.primaryColor,
                image: 'assets/images/Calendar.svg',
                text: 'Daily Sign\nLanguage words ',
                onTap: () {
                  context.pushNamed(Routes.learnInstructionsWelcomeMsgView);
                },
              ),
              ServicesHorizontalWidget(
                background: Color(0xffE3E8FF),
                image: 'assets/images/book.svg',
                text: 'Sign Language\nDictionary',

                onTap: (){

context.pushNamed( Routes.dictionaryScreen);

                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ServicesHorizontalWidget extends StatelessWidget {
  const ServicesHorizontalWidget({
    super.key,
    required this.background,
    required this.image,
    required this.text, this.onTap,

  });

  final Color background;
  final String image;
  final String text;
  final void Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          width: double.infinity, // Take full width
          height: 108.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.lightGray.withOpacity(0.3),
                    child: SvgPicture.asset(
                      image,
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    text,
                    style: TextStyles.font16WhiteMedium
                        .copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}