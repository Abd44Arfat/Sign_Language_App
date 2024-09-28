import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../features/auth/reset_password/presentation/widgets/custom_app_bar.dart';
import '../theming/styles.dart';
import 'app_text_button.dart';
import 'app_text_form_field.dart';

class ResetPasswordWidgets extends StatelessWidget {
  const ResetPasswordWidgets(
      {super.key,
      required this.titleText,
      required this.subtitleText,
      required this.widget,
      required this.buttonText,
      required this.onPressed});
  final String titleText, subtitleText, buttonText;
  final Widget widget;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView(
        padding: EdgeInsets.zero,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Row(
            children: [CustomAppBar(), Expanded(child: SizedBox())],
          ),
          Text(
            titleText,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 35,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(subtitleText,
              style: TextStyle(color: Colors.grey[600], fontSize: 25)),
          const SizedBox(
            height: 40,
          ),
          widget,
          // const AppTextFormField(hintText: 'Email'),
          const SizedBox(
            height: 80,
          ),
          AppTextButton(
              buttonText: buttonText,
              textStyle: TextStyles.font18WhiteSemiBold
                  .copyWith(fontWeight: FontWeight.w700),
              onPressed: onPressed),
        ],
      ),
    );
  }
}
