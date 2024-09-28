import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/auth/reset_password/manager/new_password_cubit/new_password_state.dart';

import '../../../../../core/widgets/reset_password_widgets.dart';
import '../../../login/presentation/widgets/password_text_form_field.dart';
import '../../manager/new_password_cubit/new_password_cubit.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({super.key });

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();
    String? password, confirmPassword;
    return BlocListener<PasswordCubit, NewPasswordState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Form(
        key: _key,
        child: ResetPasswordWidgets(
            titleText: 'Create New Password',
            subtitleText:
            'Your password must be different from previous used password',
            widget: SizedBox(
              height: 200,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  PasswordTextFormField(
                    controller: _passwordController,
                    hintText: 'Password',
                    onChanged: (data){
                      password = data;
                      },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordTextFormField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                     onChanged: (data){
                      confirmPassword = data;
            },
                  ),
                ],
              ),
            ),
            buttonText: 'Create New Password',
            onPressed: () {
              if(_key.currentState!.validate()){

                  BlocProvider.of<PasswordCubit>(context).checkPasswords(password!, confirmPassword!);
                  setState(() {});
                  print('seccess');

              }

              else{

              }

             // context.read<PasswordCubit>().checkPasswords(password!, confirmPassword!);
              //showNewWidget = true;


            }),
      ),
    );
  }
}
