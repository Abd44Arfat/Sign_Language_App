import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/common_words/presentation/widgets/common_words_view_body.dart';

class CommonWordsView extends StatelessWidget {
  const CommonWordsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map? arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    print(arguments);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: CommonWordsViewBody(
        arguments: arguments,
      ),
    );
  }
}
