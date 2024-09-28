import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/app_text_form_field.dart';
import 'package:sign_lang_app/core/widgets/reset_password_widgets.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/custom_app_bar.dart';
import '../../../../../core/routing/routes.dart';
import '../../../helper.dart';


class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey();
    return ResetPasswordWidgets(
      titleText: "Reset Password",
      subtitleText:
          'Enter Yor email , we will send a verification code to your Email',
      widget: Form(
        key: _key,
          child: const AppTextFormField(

              hintText: 'Email', validator: emailValidator,)),
      buttonText: 'Send Email',
      onPressed: () {
        if(_key.currentState!.validate()){
          Navigator.pushNamed(context, Routes.getVerificationCode);
        }

      },
    );
  }
}
