import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/local_data_source.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/dictionary_list_view_item.dart';

class DictionaryListView extends StatefulWidget {
  const DictionaryListView(
      {super.key, required this.dictionary, this.shrinkWrap = false});

  final List<DictionaryEntity> dictionary;
  final bool shrinkWrap;

  @override
  State<DictionaryListView> createState() => _DictionaryListViewState();
}

class _DictionaryListViewState extends State<DictionaryListView> {
  late ScrollController _scrollController;
  var nextPage = 2;
  var isLoading = false;
  Set<String> savedItems = {}; // Track saved items by their identifiers

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _loadSavedItems(); // Load saved items on initialization
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadSavedItems() async {
    final localDataSource =
        DictionaryLocalDataSourceImpl(); // Ideally, inject this
    final savedList = localDataSource.fetchSavedItems();
    setState(() {
      savedItems = savedList
          .map((item) => item.mainTitle)
          .toSet(); // Use unique field to identify items
    });
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels >=
        0.7 * _scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchDictionaryListCubit>(context)
            .fetchDictionaryList(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  void _saveItem(DictionaryEntity item) {
    if (!savedItems.contains(item.mainTitle)) {
      final localDataSource =
          DictionaryLocalDataSourceImpl(); // Ideally, inject this
      localDataSource.saveDictionaryItem(item);
      setState(() {
        savedItems
            .add(item.mainTitle); // Use a unique field to identify the item
      });
      print("Saved: ${item.mainTitle}"); // Confirm the save
    } else {
      print("Item already saved: ${item.mainTitle}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: widget.shrinkWrap
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      shrinkWrap: widget.shrinkWrap,
      itemCount: widget.dictionary.length,
      itemBuilder: (context, index) {
        return FadeInLeft(
          from: index * 30,
          child: DictionaryListViewItem(
            title: widget.dictionary[index].mainTitle,
            isSaved: savedItems
                .contains(widget.dictionary[index].mainTitle), // Check if saved
            onSave: () =>
                _saveItem(widget.dictionary[index]), // Pass save action
          ),
        );
      },
    );
  }
}
