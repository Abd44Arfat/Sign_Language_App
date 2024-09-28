import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_text_form_field.dart';
class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key, required this.hintText, this.onChanged, this.controller});
  final String hintText;
  final dynamic Function(String)? onChanged;

  final TextEditingController? controller;
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isObscure =true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(

      controller: widget.controller,
        onChanged: widget.onChanged,
        isObscureText: isObscure ,
        hintText: widget.hintText , suffixIcon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(onPressed: (){
        isObscure = !isObscure ;
        setState(() {

        });
      }, icon:ImageIcon(isObscure ? AssetImage( 'assets/icons/see_password.png' ,) : AssetImage('assets/icons/vision.png'),size: 26,),),
    ), validator: (data ) {
        if(data!.isEmpty){
          return 'please enter your password';
        } else if(data.length < 8){
          return 'password should have atleast 8 characters ';
        }
    },);
  }
}
