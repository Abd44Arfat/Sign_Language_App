import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/words_card.dart';

class WordsCardsList extends StatelessWidget {
  const WordsCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: 5, (context, index) {
      return const WordsCard(text: 'how are you');
    }));
  }
}
