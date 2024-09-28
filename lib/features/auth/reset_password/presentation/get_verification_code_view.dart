import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/auth/reset_password/manager/verification_cubit/verification_cubit.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/get_verification_code_view_body.dart';

class GetVerificationCodeView extends StatelessWidget {
  const GetVerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => VerificationCubit(),
        child:Scaffold(body: const GetVerificationCodeViewBody() ,) ,

    );
  }
}
