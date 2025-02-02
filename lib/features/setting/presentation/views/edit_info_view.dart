import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/edit_info_view_body.dart';

class EditInfoView extends StatefulWidget {
  const EditInfoView({super.key});

  @override
  _EditInfoViewState createState() => _EditInfoViewState();
}

class _EditInfoViewState extends State<EditInfoView> {
  late String currentUserName = '';
  late String currentUserEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    currentUserEmail =
        await SharedPrefHelper.getString(SharedPrefKeys.userEmail) ?? '';
    currentUserName =
        await SharedPrefHelper.getString(SharedPrefKeys.username) ?? '';

    // To update the UI after loading data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentUserName.isNotEmpty && currentUserEmail.isNotEmpty
          ? EditProfileViewBody(
              currentUserName: currentUserName,
              currentUserEmail: currentUserEmail,
            )
          : const Center(
              child:
                  CircularProgressIndicator()), // Show loading indicator while fetching
    );
  }
}
