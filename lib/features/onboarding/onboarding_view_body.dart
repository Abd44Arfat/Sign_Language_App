import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';
import 'package:sign_lang_app/core/widgets/next_button.dart';
import 'package:sign_lang_app/features/onboarding/views/onboarding_page1_view_body.dart';
import 'package:sign_lang_app/features/onboarding/views/onboarding_page2_view_body.dart';
import 'package:sign_lang_app/features/onboarding/views/onboarding_page3_view_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 40,
          ),
          currentIndex < 2
              ? SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.registerScreen);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyles.font14DarkBlueMedium.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(
                  height: 50,
                ),
          Flexible(
            child: SizedBox(
              height: 600,
              child: PageView(
                onPageChanged: (index) {
                  currentIndex = index;
                  setState(() {});
                },
                controller: _controller,
                children: const [
                  OnboardingPage1ViewBody(),
                  OnboardingPage2ViewBody(),
                  OnboardingPage3ViewBody(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const ExpandingDotsEffect(
                activeDotColor: ColorsManager.primaryColor,
                dotHeight: 11,
                dotWidth: 12),
          ),
          const SizedBox(
            height: 50,
          ),
          NextButton(
            onPressed: () {
              if (currentIndex < 2) {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeIn,
                );
              } else {
                SharedPrefHelper.setData(SharedPrefKeys.onboardingCompleted,
                    true); // Mark onboarding as completed
                Navigator.pushReplacementNamed(context, Routes.registerScreen);
              }
            },
          ),
        ],
      ),
    );
  }

  dynamic Function()? skipAction(context) {
    return () {
      SharedPrefHelper.setData(SharedPrefKeys.onboardingCompleted,
          true); // Mark onboarding as completed
      Navigator.pushReplacementNamed(context, Routes.loginScreen);
    };
  }
}
