import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/features/common_words/commom_words_view_body.dart';

class CommonWordsView extends StatelessWidget {
  const CommonWordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommomWordsViewBody(),
    );
  }
}
