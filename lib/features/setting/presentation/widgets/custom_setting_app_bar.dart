import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class CustomSettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSettingAppBar({super.key, required this.userName, required this.userEmail});
final String userName;
final String userEmail;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 100, // Set the height of the AppBar
      title: Container(
        padding: EdgeInsets.symmetric(vertical: 10), // Adjust vertical padding if needed
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[200],
            radius: 30,
            child: Text(
              "AA",
              style: TextStyles.font20BlackExtraBold,
            ), // Adjust the radius for the avatar
          ),
          title: Text(
            userName, // Main title
            style: TextStyles.font16Blackbold.copyWith(color: Colors.white),
          ),
          subtitle: Text(
          userEmail, // Subtitle
            style: TextStyles.font15BlackMedium.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100); // Provide the preferred size here
}