import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/custom_app_bar.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/about_us_view_body.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    /*Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;*/
    return _lightOrDark(context, isDarkMode);
  }
}

Widget _lightOrDark(context, bool isDarkMode) {
  if (isDarkMode) {
    return _inDarkMode(context);
  } else {
    return _inLightMode(context);
  }
}

Widget _inDarkMode(context) {
  return const Scaffold(
    body: CustomStack(
      width: double.maxFinite,
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(pageName: 'About Us'),
            Expanded(
              child: AboutUsViewBody(),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _inLightMode(context) {
  return const Scaffold(
    body: Column(
      children: [
        SizedBox(
          height: 54,
        ),
        CustomAppBar(pageName: 'About Us'),
        Expanded(
          child: AboutUsViewBody(),
        ),
      ],
    ),
  );
}
