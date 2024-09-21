import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/app_text_form_field.dart';

import 'dictionary_list_view.dart';

class DictionaryViewBody extends StatelessWidget {
  const DictionaryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
//list

      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: AppTextFormField(
            hintText: 'Search for a Word',
          ),
        ),
        Expanded(child: DictionaryListView())
      ],
    );
  }
}
