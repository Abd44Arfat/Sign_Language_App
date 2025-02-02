import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';

import 'package:sign_lang_app/features/setting/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/contact_us.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/custom_setting_app_bar.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/setting_item.dart';
import '../../../../core/routing/routes.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CustomSettingAppBar(),
          SizedBox(height: 30.h),
          SettingItem(
            title: 'Saved words',
            imagePath: 'assets/icons/saved_words.png',
            iconWidth: 29,
            iconHeight: 29,
            onTap: () {
              Navigator.pushNamed(context, Routes.SavedWordsScreen);
            },
          ),
          SettingItem(
            title: 'Edit Profile',
            //imagePath: 'assets/icons/edit_info.png',
            imagePath: 'assets/icons/edit-profile.png',
            onTap: () {
              Navigator.pushNamed(context, Routes.editInfoview);
            },
          ),
          SettingItem(
            title: 'About us',
            imagePath: 'assets/icons/about.png',
            onTap: () {
              Navigator.pushNamed(context, Routes.aboutUsView);
            },
          ),
          SettingItem(
            title: 'Contact us',
            imagePath: 'assets/icons/contact_us.png',
            backIcon: false,
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: const Color(0xff19221D),
                  context: context,
                  builder: (context) {
                    return const ContactUs();
                  });
            },
          ),
          SettingItem(
            title: isDarkTheme ? "Light Mode" : "Dark Mode",
            imagePath: isDarkTheme
                ? 'assets/icons/brightness.png'
                : 'assets/icons/night-mode.png',
            onTap: () {
              context.read<ThemesCubit>().toggleTheme();
            },
            backIcon: false,
          ),
          SettingItem(
            title: 'Logout',
            iconWidth: 29,
            iconHeight: 29,
            imagePath: 'assets/icons/logout.png',
            backIcon: false,
            onTap: () async {
              await SharedPrefHelper.removeData(SharedPrefKeys.userToken);
              context.pushNamedAndRemoveUntil(Routes.loginScreen,
                  predicate: (Route<dynamic> route) =>
                      false); // Remove all previous routes)
            },
          ),
        ],
      ),
    );
  }
}
