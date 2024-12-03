import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/features/setting/domain/entity/edit_info_entity.dart';
import 'package:sign_lang_app/features/setting/domain/usecase/edit_info_usecase.dart';
import 'package:sign_lang_app/features/setting/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:sign_lang_app/features/setting/presentation/manager/edit_profile_cubit/edit_profile_state.dart';

import '../../../../core/widgets/custom_button_animation.dart';
import '../../../auth/presentation/widgets/loading_button.dart';

class EditProfileButton extends StatefulWidget {
  const EditProfileButton({super.key, this.name, this.email});
  final String? name, email;
  @override
  State<EditProfileButton> createState() => _EditProfileButtonState();
}

class _EditProfileButtonState extends State<EditProfileButton> {
  final GlobalKey<CustomButtonState> key = GlobalKey();
  EditInformationEntity? editInformationEntity;
  EditInfoUseCase? editInfoUseCase;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.name ?? '';
    emailController.text = widget.email ?? '';
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  //final User user;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
      return LoadingButton(
        title: 'Edit Profile',
        onTap: () {
          final String name = nameController.text;
          final String email = emailController.text;

          final editInformationEntity =
              EditInformationEntity(name: name, email: email);
          context.read<EditProfileCubit>().updateUserInformation(
              usecase: getIt<EditInfoUseCase>(), entity: editInformationEntity);
        },
        btnKey: EditProfileCubit.get(context).btnKey,
      );
    }, listener: (context, state) {
      if (state is EditProfileSuccess) {
        final data = {
          'name': state.name,
          'email': state.email,
        };

        Navigator.pop(context, data);
      }

      if (state is EditProfileFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error in editing profile')),
        );
        print('error in edit profile button');
      }
    });
  }
}
