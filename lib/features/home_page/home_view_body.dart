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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: FutureBuilder<String?>(
            future: SharedPrefHelper.getStringNullable(SharedPrefKeys.username),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Error: ${snapshot.error}',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ));
              } else {
                String userName = snapshot.data ?? 'User';
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHomeAppBar(
                      title: 'Good Morning',
                      subtitle: userName,
                    ),
                    const SizedBox(height: 160, child: SpeakWithHands()),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      child: Text(
                        'Services',
                        style: TextStyles.font20WhiteSemiBold.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    const ServicesWidget(),
                    const SizedBox(height: 12),
                    const BuildCommonWordsHeader(),
                    const SizedBox(height: 12),
                    const HorizontalWordList(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
