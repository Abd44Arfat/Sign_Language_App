import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/dictionary_list_view.dart';

class FetchDictionaryListViewBlocBuilder extends StatelessWidget {
  final String searchText; // New parameter for search text
final int itemCount; 
  const FetchDictionaryListViewBlocBuilder({
    super.key,
    this.searchText = '',
    this.itemCount = 0, 
  
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDictionaryListCubit, FetchDictionaryListState>(
      builder: (context, state) {
        if (state is FetchDictionaryListSuccess) {

    

          // Filter the dictionary list based on searchText
          final displayItems = itemCount > 0 ? state.dictionaryList.take(itemCount).toList()
             : state.dictionaryList.where((item) => item.mainTitle.toLowerCase().startsWith(searchText.toLowerCase()))
              .toList();


          if (displayItems.isEmpty) {
            return Center(child: Text('No results found for "$searchText"',style: TextStyles.font16GraySemibold,));
          } else {
            return DictionaryListView(dictionary: displayItems);
          }
        } else if (state is FetchDictionaryListFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}