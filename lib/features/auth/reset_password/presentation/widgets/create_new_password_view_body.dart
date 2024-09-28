import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/widgets/app_text_button.dart';
import 'package:sign_lang_app/core/widgets/reset_password_widgets.dart';
import 'package:sign_lang_app/features/auth/login/presentation/widgets/password_text_form_field.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/reset_password_widget.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/success_widget.dart';
import '../../../../../core/routing/routes.dart';
import '../../manager/new_password_cubit/new_password_cubit.dart';
import '../../manager/new_password_cubit/new_password_state.dart';
import 'blurred_success_widget.dart';

class CreateNewPasswordViewBody extends StatelessWidget {
  const CreateNewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit, NewPasswordState>(
      builder: (context , state) {
          if (state is PasswordsMatch) {
             return BlurredSuccessWidget();
          }
          else if (state is PasswordsDoNotMatch) {
            return ResetPasswordWidget();
          }
          else if (state is PasswordUpdated) {
            return BlurredSuccessWidget();
          } else if (state is PasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }

            return const  ResetPasswordWidget();
        }, );

  }
}

/*
  Widget _buildBlurredSuccessView(BuildContext context) {
    return Stack(
      children: [
        buildResetPasswordWidgets(),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
          child: const SuccessWidget(),
        ))
      ],
    );
  }
*/
  /*
  ResetPasswordWidgets buildResetPasswordWidgets() {
    return ResetPasswordWidgets(
        titleText: 'Create New Password',
        subtitleText:
        'Your password must be different from previous used password',
        widget: SizedBox(
          height: 160,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              PasswordTextFormField(
                controller: _passwordController,
                hintText: 'Password',
                onChanged: (data) {
                  password = data;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextFormField(
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
                onChanged: (data) {
                  confirmPassword = data;
                },
              ),
            ],
          ),
        ),
        buttonText: 'Create New Password',
        onPressed: () {
          if (confirmPassword == password && password != null) {
            print('seccess');
            _showNewWidget = true;
            setState(() {});
          }
        });
  }*/


