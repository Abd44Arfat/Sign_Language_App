import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/app_text_form_field.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/fetch_list_view_bloc_builder.dart';

import 'dictionary_list_view.dart';

class DictionaryViewBody extends StatelessWidget {
  const DictionaryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
//list

      children: [
        AppTextFormField(
          hintText: 'Search for a Word',
        ),
        FetchDictionaryListViewBlocBuilder()
      ],
    );
  }
}
