import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/dictionary_list_view.dart';

class FetchDictionaryListViewBlocBuilder extends StatelessWidget {
  final int itemCount; // New parameter to control item count

  const FetchDictionaryListViewBlocBuilder({
    super.key,
    this.itemCount = 0, // Default to 0 (show all items)
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDictionaryListCubit, FetchDictionaryListState>(
      builder: (context, state) {
        if (state is FetchDictionaryListSuccess) {
          // Use itemCount to slice the dictionary list
          final displayItems = itemCount > 0
              ? state.dictionaryList.take(itemCount).toList()
              : state.dictionaryList;

          return DictionaryListView(dictionary: displayItems);
        } else if (state is FetchDictionaryListFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}