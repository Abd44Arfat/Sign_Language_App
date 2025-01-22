import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/widgets/app_text_button.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  final String adminEmail = 'doha.ibrahim2003@gmail.com';
  final String subject = "For Support Request"; // Predefined email subject
  final String body = "Hello ,\n\nI need assistance with ...";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Wrap(
        children: [
          Center(
              child: Text(
            'Contact via',
            style: TextStyles.font18DarkBlueBold.copyWith(color: Colors.white),
          )),
          const SizedBox(
            height: 30,
          ),
          AppTextButton(
              buttonText: 'Whatsapp',
              textStyle:
                  TextStyles.font16WhiteMedium.copyWith(color: Colors.black),
              onPressed: () {
                final Uri whatsapp = Uri.parse(
                    'https://chat.whatsapp.com/KKPzTOm0qml6TOow6NC97F');
                launcher.launchUrl(whatsapp);
              }),
          const SizedBox(
            height: 70,
          ),
          AppTextButton(
              buttonText: 'Email',
              textStyle:
                  TextStyles.font16WhiteMedium.copyWith(color: Colors.black),
              onPressed: () async {
                Uri uri = Uri.parse(
                    'mailto:doha.ibrahim2003@gmail.com?subject=Technical Support&body=Hi , I have a problem in');
                if (!await launcher.launchUrl(uri)) {
                  debugPrint('couldnot launch the url');
                }
                //_sendEmail();
              })
        ],
      ),
    );
  }
}
