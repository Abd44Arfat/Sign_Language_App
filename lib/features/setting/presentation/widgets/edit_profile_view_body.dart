import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/edit_profile_button.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/edit_profile_form_field.dart';

import '../../../../core/theming/styles.dart';
class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key, required this.name, required this.userEmail});
  final String name , userEmail;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height *0.12,),
          Text("Edit Profile" , style: TextStyles.font32PrimaryExtraBold.copyWith(fontSize: 40) , ),
          Text('edit your profile' , style: TextStyles.font16GraySemibold.copyWith(fontSize: 22),),

         const EditProfileFormField(),
          EditProfileButton(name: name, email: userEmail,),

        ],
      ),
    );
  }
}
