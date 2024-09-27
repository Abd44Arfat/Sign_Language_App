import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_text_form_field.dart';
class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isObscure =true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
        isObscureText: isObscure ,
        hintText: 'Password' , suffixIcon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(onPressed: (){
        isObscure==true ? isObscure=false : isObscure=true ;
        setState(() {

        });
      }, icon:const ImageIcon(AssetImage( 'assets/icons/see_password.png' ,) ,size: 26,),),
    ));
  }
}
