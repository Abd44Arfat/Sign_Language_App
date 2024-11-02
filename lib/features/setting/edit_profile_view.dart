import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/features/setting/data/repo_impl/edit_info_repo_iml.dart';
import 'package:sign_lang_app/features/setting/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/edit_profile_view_body.dart';

import 'domain/usecase/edit_info_usecase.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.name, required this.email});
  final String name , email;
  @override
  Widget build(BuildContext context) {
 //  var arguments = ModalRoute.of(context)!.settings.arguments as Map<String , dynamic> ;
   // print(arguments);
    return Scaffold(
      body: EditProfileViewBody(name: name ?? "doha" , userEmail: email ?? "doha",),
    );

  }
}
