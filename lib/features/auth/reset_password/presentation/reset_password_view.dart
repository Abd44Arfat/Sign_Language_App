import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';

import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/reset_password_view_body.dart';
class ResetPasswordView extends StatelessWidget  {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomStack(child: ResetPasswordViewBody())
    );
  }

}