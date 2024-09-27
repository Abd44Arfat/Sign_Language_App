import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/widgets/app_text_button.dart';
import 'package:sign_lang_app/core/widgets/app_text_form_field.dart';
import 'package:sign_lang_app/features/auth/login/presentation/widgets/password_text_form_field.dart';

import '../../../../../core/widgets/google_facebook_auth.dart';
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(height: 60,),
            SizedBox(height: 55 ,
            child: Text('Login' ,textAlign: TextAlign.center, style: TextStyles.font24BlackBold.copyWith(fontSize: 32 ),) ,),
        Text('Sign in for your account now' ,textAlign: TextAlign.center , style: TextStyles.font18BlackLight.copyWith(color: Colors.grey[600] , fontWeight: FontWeight.w600),),
        const SizedBox(height: 50,),
        const AppTextFormField(hintText: 'Email'),
            const SizedBox(height: 30,),
            const PasswordTextFormField(),
            SizedBox(
             height: 60,
             child: Align(
               alignment: Alignment.centerRight,
               child: GestureDetector(
                      child:  Text( 'Did you forget your password ?' , style: TextStyles.font20MediumLightBlueRegular.copyWith(fontSize: 15), ), onTap: () {
                            Navigator.pushNamed(context, Routes.resetPassword);
               },),
             ),
           ),
            const SizedBox(height: 25,),
            AppTextButton(buttonText: 'Login'  ,textStyle: TextStyles.font18WhiteSemiBold.copyWith(fontWeight: FontWeight.w700), onPressed: (){}),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
                 child:Row(children: [
                   Text('new in Sign Talk ?' , style: TextStyles.font18BlackLight.copyWith(fontSize: 16 ,color: Colors.black , fontWeight: FontWeight.w300)),
                   TextButton(child: Text('Sign up' ,  style: TextStyles.font20MediumLightBlueRegular.copyWith(fontSize: 16)) , onPressed: () {
                     Navigator.pushReplacementNamed(context, Routes.registerScreen);
            },)
                 ],),

              ),
            const SizedBox(height: 40,),
            const GoogleFacebookAuth(),

          ],
        ),);
  }
}
