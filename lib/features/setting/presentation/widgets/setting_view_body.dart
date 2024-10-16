import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/setting_item.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      
      
      children: [
      
      SizedBox(height: 30.h,),
      SettingItem(title: 'Saved words', onTap: () {  },),
      SettingItem(title: 'Edit Profile', onTap: () {  },),
      SettingItem(title: 'About us', onTap: () {  },),
      SettingItem(title: 'Help and Support', onTap: () {  },),
      SettingItem(title: 'privacy Settings', onTap: () {  },),
      SettingItem(title: 'Logout', onTap: () {  },),
      
      
      ],
      
      ),
    );
  }
}