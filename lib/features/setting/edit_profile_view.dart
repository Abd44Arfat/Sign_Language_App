import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.name, required this.email});
  final String name, email;
  @override
  Widget build(BuildContext context) {
    //  var arguments = ModalRoute.of(context)!.settings.arguments as Map<String , dynamic> ;
    // print(arguments);
    return Scaffold(
      body: EditProfileViewBody(
        name: name ?? "doha",
        userEmail: email ?? "doha",
      ),
    );
  }
}
