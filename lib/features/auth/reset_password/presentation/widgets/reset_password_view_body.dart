import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/app_text_form_field.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/custom_app_bar.dart';

import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(24),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const SizedBox(height: 60,),
           const CustomAppBar(),
          Text('Reset Password' , style:TextStyle(color: Colors.grey[800] , fontSize: 35 , fontWeight: FontWeight.w700) ,),
          SizedBox(height: 20,),
          Text('Enter Yor email , we will send a verification code to your Email' , style:TextStyle(color: Colors.grey[600] , fontSize: 25 ) ),
          SizedBox(height: 40,),
          const AppTextFormField(hintText: 'Email'),
          SizedBox(height: 80,),
          AppTextButton(buttonText: 'Login'  ,textStyle: TextStyles.font18WhiteSemiBold.copyWith(fontWeight: FontWeight.w700), onPressed: (){}),
          
        ],
      ),
    );
  }
}
