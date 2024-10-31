import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/custom_app_bar.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/about_us_view_body.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomStack(
        width : double.maxFinite,
      child:  Column(
        children: [
          SizedBox(height: 54,),
       CustomAppBar(pageName: 'About Us'),
          Expanded(child: AboutUsViewBody(), ),
      ],
    ),)

    );
  }
}
