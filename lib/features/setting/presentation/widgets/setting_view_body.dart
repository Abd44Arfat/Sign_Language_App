import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/widgets/app_text_button.dart';
import 'package:sign_lang_app/features/setting/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/custom_setting_app_bar.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/setting_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/routing/routes.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    // List<String> list = [userName , userEmail];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CustomSettingAppBar(),
          SizedBox(
            height: 30.h,
          ),
          SettingItem(
            title: 'Saved words',
            onTap: () {
              Navigator.pushNamed(context, Routes.SavedWordsScreen);
            },
          ),
          SettingItem(
            title: 'Edit Profile',
            onTap: () {
              Navigator.pushNamed(context, Routes.editInfoview);
            },
          ),
          SettingItem(
            title: 'About us',
            onTap: () {
              Navigator.pushNamed(context, Routes.aboutUsView);
            },
          ),
          SettingItem(
            title: 'Help and Support',
            onTap: () {},
          ),
          SettingItem(
            title: 'Contact us',
            backIcon: false,
            onTap: () {
              showModalBottomSheet(
                backgroundColor: const Color(0xff19221D),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Wrap(
                      children: [
                        Center(
                            child: Text(
                          'Contact via',
                          style: TextStyles.font18DarkBlueBold
                              .copyWith(color: Colors.white),
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        AppTextButton(
                            buttonText: 'whatsapp',
                            textStyle: TextStyles.font16WhiteMedium
                                .copyWith(color: Colors.black),
                            onPressed: () {
                              final Uri whatsapp = Uri.parse(
                                  'https://chat.whatsapp.com/KKPzTOm0qml6TOow6NC97F');
                              launchUrl(whatsapp);
                            })
                      ],
                    ),
                  );
                },
              );
            },
          ),
          SettingItem(
            title: isDarkTheme ? "Light Mode" : "Dark Mode",
            onTap: () {
              context.read<ThemesCubit>().toggleTheme();
            },
            backIcon: false,
          ),
          SettingItem(
            title: 'Logout',
            backIcon: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
