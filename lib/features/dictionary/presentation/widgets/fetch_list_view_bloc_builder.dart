import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/dictionary_list_view.dart';

class FetchDictionaryListViewBlocBuilder extends StatelessWidget {
  const FetchDictionaryListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDictionaryListCubit, FetchDictionaryListState>(
      builder: (context, state) {
        if (state is FetchDictionaryListSuccess) {
          return Expanded(child: DictionaryListView(dictionary: state.dictionaryList,));
        } else if (state is FetchDictionaryListFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
