import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';
import 'package:sign_lang_app/features/home_page/widgets/start_now_btn.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FadeInLeft(
              child: Container(
                height: 227.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffe6effd)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 40.w,
                        child: CircleAvatar(
                          backgroundColor:
                              ColorsManager.lightGray.withOpacity(0.3),
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
                        backgroundColor: Colors.blue[700],
                        buttonText: 'Start Now',
                        textStyle: TextStyles.font15BlackMedium.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              FadeInDown(
                child: ServicesHorizontalWidget(
                  background: const Color(0xfffbff8b),
                  image: 'assets/images/Calendar.svg',
                  text: 'Daily Sign\nLanguage words ',
                  onTap: () async {
                    // Check if the test has been completed
                    bool testCompleted = await SharedPrefHelper.getBool(SharedPrefKeys.weclometestcomplete);
                    
                    if (testCompleted) {
                      // Navigate to the desired screen if test is completed
                      context.pushNamed(Routes.CategoriesView);
                    } else {
                      // Navigate to Achievement2 if test is not completed
                      context.pushNamed(Routes.learnInstructionsLetsStartView);
                    }
                  },
                ),
              ),
              FadeInUp(
                child: ServicesHorizontalWidget(
                  background: const Color(0xffe6effd),
                  image: 'assets/images/book.svg',
                  text: 'Sign Language\nDictionary',
                  onTap: () {
                    context.pushNamed(Routes.dictionaryScreen);
                  },
                ),
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
    required this.text,
    this.onTap,
  });

  final Color background;
  final String image;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          width: double.infinity,
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
                SizedBox(
                  height: 30.h,
                  width: 30.w,
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