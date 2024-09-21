import 'package:flutter/material.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/dictionary_list_view_item.dart';

class DictionaryListView extends StatelessWidget {
  const DictionaryListView({super.key, required this.dictionary});
final List<DictionaryEntity> dictionary;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dictionary.length,
      itemBuilder: (context, index) {
        return DictionaryListViewItem(title: dictionary[index].mainTitle,);
      },
    );
  }
}
