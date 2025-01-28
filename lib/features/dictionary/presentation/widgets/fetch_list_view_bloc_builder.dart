import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/errors/build_error.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/dictionary_list_view.dart';

class FetchDictionaryListViewBlocConsumer extends StatefulWidget {
  final int itemCount;
  final String? searchText;
  final bool shrinkWrap; 
  const FetchDictionaryListViewBlocConsumer({
    super.key,
    this.itemCount = 0,
    this.searchText = '',
    this.shrinkWrap = false,
  });

  @override
  State<FetchDictionaryListViewBlocConsumer> createState() =>
      _FetchDictionaryListViewBlocConsumerState();
}

class _FetchDictionaryListViewBlocConsumerState
    extends State<FetchDictionaryListViewBlocConsumer> {
  List<DictionaryEntity> dictionaryList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchDictionaryListCubit, FetchDictionaryListState>(
      listener: (context, state) {
        if (state is FetchDictionaryListSuccess) {
          dictionaryList.addAll(state.dictionaryList);
        }

        if (state is FetchDictionaryListPaginationFailure) {
          buildErrorBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        List<DictionaryEntity> displayItems;

        if (state is FetchDictionaryListSuccess ||
            state is FetchDictionaryListPaginationLoading ||
            state is FetchDictionaryListPaginationFailure) {
          // Filter the dictionary list based on searchText
          displayItems = widget.itemCount > 0
              ? dictionaryList.take(widget.itemCount).toList()
              : dictionaryList
                  .where((item) => item.mainTitle
                      .toLowerCase()
                      .startsWith(widget.searchText!.toLowerCase()))
                  .toList();
//              : dictionaryList.where((item) => item.mainTitle.toLowerCase().startsWith(widget.searchText.toLowerCase())).toList();
          if (displayItems.isEmpty) {
            return Center(
                child: Text(
              'No results found for "${widget.searchText}"',
              style: TextStyles.font16WhiteMedium
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ));
          }

          return DictionaryListView(
            dictionary: displayItems,
            shrinkWrap: widget.shrinkWrap,
          );
        } else if (state is FetchDictionaryListFailure) {
          return Center(
              child: Text(
            state.errMessage,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
