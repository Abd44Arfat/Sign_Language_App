import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/custom_setting_app_bar.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView(
      {super.key, required this.userName, required this.userEmail});
  final String userName;
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomStack(
          child: SettingViewBody(
        userName: userName,
        userEmail: userEmail,
      )),

    );
  }
}
