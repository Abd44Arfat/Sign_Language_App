import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/build_error.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/widgets/app_text_button.dart';
import 'package:sign_lang_app/core/widgets/app_text_form_field.dart';
import 'package:sign_lang_app/core/widgets/custom_button_animation.dart';
import 'package:sign_lang_app/core/widgets/google_facebook_auth.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_req.dart';
import 'package:sign_lang_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:sign_lang_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sign_lang_app/features/auth/presentation/widgets/loading_button.dart';
import 'package:sign_lang_app/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:sign_lang_app/features/auth/presentation/widgets/terms_and_condition.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, userName, password, confirmPassword;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 55,
                child: Text(
                  'create an account',
                  style: TextStyles.font14DarkBlueMedium.copyWith(fontSize: 32),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              AppTextFormField(
                hintText: 'Name',
                onSaved: (value) {
                  userName = value!;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              AppTextFormField(
                hintText: 'Email',
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              PasswordTextFormField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              PasswordTextFormField(
                onSaved: (value) {
                  confirmPassword = value!;
                },
              ),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(
                height: 25,
              ),
            
              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  return LoadingButton(
                    title: 'Login',
                    onTap: () {
 

    if (formKey.currentState!.validate()&&isTermsAccepted) {
                    formKey.currentState!.save();
                     
context.read<SignupCubit>().execute(usecase:   getIt<SignupUsecase>(),

params:  SignupReqParams(
                            name: userName,
                            email: email,
                            password: password,
                            repassword: confirmPassword));


              }else {
                      buildErrorBar(
                          context, 'يجب عليك الموافقة على الشروط والإحكام');
                    }



                    },

                    
                    btnKey: SignupCubit.get(context).btnKey,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    Text('new in Sign Talk ?',
                        style: TextStyles.font14DarkBlueMedium.copyWith(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300)),
                    TextButton(
                      child: Text('login',
                          style: TextStyles.font14DarkBlueMedium
                              .copyWith(fontSize: 16)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginScreen);
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const GoogleFacebookAuth(),
            ],
          ),
        ),
      ),
    );
  }
}