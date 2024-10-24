import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/widgets/app_text_button.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/custom_setting_app_bar.dart';
import 'package:sign_lang_app/features/setting/presentation/widgets/setting_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key, required this.userName, required this.userEmail});
final String userName;
final String userEmail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomSettingAppBar(userName: userName, userEmail: userEmail,),
          SizedBox(
            height: 30.h,
          ),
          SettingItem(
            title: 'Saved words',
            onTap: () {},
          ),
          SettingItem(
            title: 'Edit Profile',
            onTap: () {},
          ),
          SettingItem(
            title: 'About us',
            onTap: () {},
          ),
          SettingItem(
            title: 'Help and Support',
            onTap: () {},
          ),
          SettingItem(
            title: 'Contact us',
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Color(0xff19221D),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Wrap(
                      
                      children: [
                        Center(
                            child: Text(
                          'Contact via',
                          style: TextStyles.font18DarkBlueBold.copyWith(color: Colors.white),
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        AppTextButton(
                            buttonText: 'whatsapp',
                            textStyle: TextStyles.font16WhiteMedium.copyWith(color: Colors.black),
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
            title: 'Logout',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
