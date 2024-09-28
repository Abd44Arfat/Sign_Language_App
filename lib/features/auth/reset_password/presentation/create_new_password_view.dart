import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/auth/reset_password/manager/new_password_cubit/new_password_cubit.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/create_new_password_view_body.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordCubit(),
      child: const Scaffold(
        body: CreateNewPasswordViewBody(),
      ),
    );
  }
}
