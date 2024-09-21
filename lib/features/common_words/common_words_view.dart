import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/features/common_words/commom_words_view_body.dart';

class CommonWordsView extends StatelessWidget {
  const CommonWordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundColor: ColorsManager.lightGray,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  color: Colors.white), // Back icon
              onPressed: () {
                Navigator.of(context).pop(); // Pops back to the previous screen
              },
            ),
          ),
        ),
      ),
      body: CommomWordsViewBody(),
    );
  }
}
