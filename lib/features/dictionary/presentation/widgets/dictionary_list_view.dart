import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/dictionary_list_view_item.dart';

class DictionaryListView extends StatelessWidget {
  const DictionaryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return DictionaryListViewItem();
      },
    );
  }
}
