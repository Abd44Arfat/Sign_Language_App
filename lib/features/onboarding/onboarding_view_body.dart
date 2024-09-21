import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/widgets/next_button.dart';
import 'package:sign_lang_app/features/onboarding_page1/onboarding_page1_view.dart';
import 'package:sign_lang_app/features/onboarding_page2/onboarding_page2_view.dart';
import 'package:sign_lang_app/features/onboarding_page3/onboarding_page3_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingViewBody extends StatefulWidget {
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
                              context, Routes.bottomNavigationScreen);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyles.font18BlackLight,
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
                  OnboardingPage1View(),
                  OnboardingPage2View(),
                  OnboardingPage3View(),
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
                activeDotColor: ColorsManager.lightGreen,
                dotHeight: 11,
                dotWidth: 12),
          ),
          const SizedBox(
            height: 50,
          ),
          NextButton(
            onPressed: () {
              currentIndex < 2
                  ? _controller.nextPage(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeIn)
                  : Navigator.pushReplacementNamed(
                      context, Routes.bottomNavigationScreen);
            },
          ),
        ],
      ),
    );
  }

  dynamic Function()? skipAction(context) {
    return () {
      Navigator.pushReplacementNamed(context, Routes.bottomNavigationScreen);
    };
  }
}
