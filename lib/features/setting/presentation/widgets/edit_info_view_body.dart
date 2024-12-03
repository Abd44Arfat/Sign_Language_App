import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/widgets/app_text_form_field.dart';
import 'package:sign_lang_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:sign_lang_app/features/auth/presentation/widgets/loading_button.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_request.dart';
import 'package:sign_lang_app/features/setting/domain/usecases/edit_info_usecase.dart';
import 'package:sign_lang_app/features/setting/presentation/Edit_info_cubit/edit_info_cubit.dart';

import '../../../../core/theming/styles.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({
    super.key,
  });

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

late String userName, UserEmail;

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: height * 0.12,
            ),
            Text(
              "Edit Profile",
              style: TextStyles.font32PrimaryExtraBold.copyWith(fontSize: 40),
            ),
            Text(
              'edit your profile',
              style: TextStyles.font16GraySemibold.copyWith(fontSize: 22),
            ),
            AppTextFormField(
              hintText: 'Name',
              onSaved: (value) {
                userName = value!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextFormField(
              hintText: 'Email',
              onSaved: (value) {
                UserEmail = value!;
              },
            ),
            BlocBuilder<EditInfoCubit, EditInfoState>(
              builder: (context, state) {
                return LoadingButton(
                  title: 'Edit Information',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      context.read<EditInfoCubit>().execute(
                          usecase: getIt<EditInfoUsecase>(),
                          params: EditInfoReqParams(
                            name: userName,
                            email: UserEmail,
                          ));
                    }
                  },
                  btnKey: EditInfoCubit.get(context).btnKey,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
