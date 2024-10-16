import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class CustomSettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.settingBackground,
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
            'Abdelrahman Arfat Mohamed', // Main title
            style: TextStyles.font16Blackbold,
          ),
          subtitle: Text(
            'abdoarfat924@gmail.com', // Subtitle
            style: TextStyles.font15BlackMedium,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100); // Provide the preferred size here
}