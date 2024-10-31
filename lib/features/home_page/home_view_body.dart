import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/widgets/build_common_words_header.dart';
import 'package:sign_lang_app/features/home_page/widgets/Horizontal_word_list_tem.dart';
import 'package:sign_lang_app/features/home_page/widgets/home_app_bar.dart';
import 'package:sign_lang_app/core/widgets/speak_with_hands.dart';
import 'package:sign_lang_app/features/home_page/widgets/services_widget.dart';
import '../../core/utils/sharedprefrence.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: FutureBuilder<String?>(
          future: SharedPrefHelper.getStringNullable(SharedPrefKeys.username), // Now returns Future<String?>
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              String userName = snapshot.data ?? 'User'; // Defaults to 'User' if null
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHomeAppBar(title: 'Good Morning', subtitle: userName,),
                  SizedBox(height: 140, child: SpeakWithHands()),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    child: Text(
                      'Services',
                      style: TextStyles.font20WhiteSemiBold,
                    ),
                  ),
                  ServicesWidget(),
                  SizedBox(height: 12),
                  BuildCommonWordsHeader(),
                  SizedBox(height: 12),
                  HorizontalWordList(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}