import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/dictionary_view_body.dart';

class DictionaryView extends StatelessWidget {
  const DictionaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomStack(child: DictionaryViewBody()),
    );
  }
}
