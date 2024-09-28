import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/reset_password_widget.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/success_widget.dart';
class BlurredSuccessWidget extends StatelessWidget {
  const BlurredSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ResetPasswordWidget(),
        Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: SuccessWidget(),
            ))
      ],
    );;
  }
}
