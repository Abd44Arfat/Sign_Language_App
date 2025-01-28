import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class EditProfileFormField extends StatefulWidget {
  const EditProfileFormField({
    super.key,
  });

  @override
  State<EditProfileFormField> createState() => _EditProfileFormFieldState();
}

class _EditProfileFormFieldState extends State<EditProfileFormField> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? email, name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
      child: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.disabled,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              AppTextFormField(
                hintText: 'Name',
                onSaved: (val) {
                  name = val;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                hintText: 'Email',
                onSaved: (val) {
                  email = val;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
