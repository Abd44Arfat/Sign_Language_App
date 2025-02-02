import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';
import 'package:sign_lang_app/core/widgets/app_text_form_field.dart';
import 'package:sign_lang_app/features/auth/presentation/widgets/loading_button.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_req.dart';
import 'package:sign_lang_app/features/change_password/domain/use_case/change_password_usecase.dart';
import 'package:sign_lang_app/features/change_password/presentation/manager/change_password_cubit.dart';
import 'package:sign_lang_app/features/change_password/presentation/manager/change_password_state.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String oldPassword, newPassword;
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String userEmail = arguments?['userEmail'];

    double height = MediaQuery.sizeOf(context).height;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 30.sp),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(height: height * 0.15),
            Text(
              "Change Password",
              style: TextStyles.font32PrimaryExtraBold.copyWith(fontSize: 40),
            ),
            Text(
              'Edit your password',
              style: TextStyles.font16GraySemibold.copyWith(fontSize: 22),
            ),
            SizedBox(
              height: 30.h,
            ),
            /*AppTextFormField(
              hintText: 'Email',
              initialValue: userEmail,
              onSaved: (value) {
                userEmail = value!;
              },
            ),*/
            const SizedBox(height: 20),
            AppTextFormField(
              hintText: 'old password',
              onSaved: (value) {
                oldPassword = value!;
              },
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              hintText: 'new password',
              onSaved: (value) {
                newPassword = value!;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
              builder: (context, state) {
                return LoadingButton(
                  title: 'Change Password',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      context.read<ChangePasswordCubit>().execute(
                          usecase: getIt<ChangePasswordUsecase>(),
                          params: ChangePasswordReq(
                              email: userEmail,
                              oldPassword: oldPassword,
                              newPassword: newPassword));

                      // Update shared preferences
                      await SharedPrefHelper.setData(
                          SharedPrefKeys.userEmail, userEmail);
                    }
                  },
                  btnKey: ChangePasswordCubit.get(context).btnKey,
                );
              },
            )
          ]),
        ));
  }
}
