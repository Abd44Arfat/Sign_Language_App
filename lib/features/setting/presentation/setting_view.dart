import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: ColorsManager.settingBackground,
        elevation: 0,
        toolbarHeight: 100, // Set the height of the AppBar
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 10), // Adjust vertical padding if needed
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[200],
              radius: 30,
              child: Text("AA",style: TextStyles.font20BlackExtraBold,), // Adjust the radius for the avatar
            ),
            title: Text(
              'Abdelrahman Arfat mohamed', // Main title
              style: TextStyles.font16Blackbold,
            ),
            subtitle: Text(
              'abdoarfat924@gmail.com', // Subtitle
             style: TextStyles.font15BlackMedium,
            ),
          ),
        ),
      ),
      body: SettingViewBody(),
    );
  }
}