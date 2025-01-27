import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/errors/build_error.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/features/change_password/presentation/manager/change_password_cubit.dart';
import 'package:sign_lang_app/features/change_password/presentation/manager/change_password_state.dart';
import 'package:sign_lang_app/features/change_password/presentation/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordFailure) {
              buildErrorBar(context, state.errorMessage);
            }
            if (state is ChangePasswordSuccess) {
              context.pop();
            }
          },
          child: ChangePasswordViewBody()),
    );
  }
}
