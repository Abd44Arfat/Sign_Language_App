import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/widgets/reset_password_widgets.dart';
import 'package:sign_lang_app/features/auth/reset_password/manager/verification_cubit/verification_cubit.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/verification_code_form.dart';

import '../../../../../core/routing/routes.dart';

class GetVerificationCodeViewBody extends StatelessWidget {
  const GetVerificationCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ResetPasswordWidgets(titleText: 'Reset Password', subtitleText: 'Enter the verification code that we have send to your Email', widget: VerificationCodeForm(), buttonText: 'reset password', onPressed: (){
      Navigator.pushNamed(context, Routes.createNewPassword);
      }
      );
  }
}
