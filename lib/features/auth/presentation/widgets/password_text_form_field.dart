import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  final Function(String?)? onSaved;

  const PasswordTextFormField({super.key, this.onSaved});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      onSaved: widget.onSaved, // Use widget.onSaved to access the parameter
      isObscureText: isObscure,
      hintText: 'Password',
      suffixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            setState(() {
              isObscure = !isObscure; // Toggle the visibility
            });
          },
          icon: ImageIcon(
            color: Theme.of(context).colorScheme.secondaryContainer,
            AssetImage(
              isObscure
                  ? 'assets/icons/view.png'
                  : 'assets/icons/see_password.png',
            ),
            size: 26,
          ),
        ),
      ),
    );
  }
}
