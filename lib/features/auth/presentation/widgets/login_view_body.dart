import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/widgets/app_text_form_field.dart';
import 'package:sign_lang_app/features/auth/data/models/signin_req.dart';
import 'package:sign_lang_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:sign_lang_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:sign_lang_app/features/auth/presentation/widgets/loading_button.dart';
import 'package:sign_lang_app/features/auth/presentation/widgets/password_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 55,
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyles.font32PrimaryExtraBold,
                ),
              ),
              Text('Sign in for your account now',
                  style: TextStyles.font20GrayMedium.copyWith(
                      color: Theme.of(context).colorScheme.secondaryContainer)),
              const SizedBox(
                height: 50,
              ),
              AppTextFormField(
                hintText: 'Email',
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              PasswordTextFormField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(
                height: 60,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Text(
                      'Forget your password ?',
                      style: TextStyles.font15DarkBlueMedium
                          .copyWith(color: ColorsManager.primaryColor),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.resetPassword);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return LoadingButton(
                    title: 'Login',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        context.read<LoginCubit>().execute(
                            usecase: getIt<SignInUsecase>(),
                            params: SigninReqParams(
                              email: email,
                              password: password,
                            ));
                      }
                    },
                    btnKey: LoginCubit.get(context).btnKey,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('new in Sign Talk ?',
                          style: TextStyles.font15DarkBlueMedium.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer)),
                      TextButton(
                        child: Text('Sign up',
                            style: TextStyles.font14DarkBlueMedium
                                .copyWith(color: ColorsManager.primaryColor)
                                .copyWith(fontSize: 16)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.registerScreen);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
