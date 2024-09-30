import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/errors/build_error.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:sign_lang_app/features/auth/presentation/register_view.dart';
import 'package:sign_lang_app/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
       

if (state is LoginSuccess) {
  context.pushReplacementNamed(Routes.bottomNavigationScreen);
  buildErrorBar(context, state.message);
  
}
if (state is LoginFailure) {

  buildErrorBar(context, state.errorMessage);
  
}

        },
        child: LoginViewBody(),
      ),
    );
  }
}
