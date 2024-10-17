import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/dictionary_list_view_item.dart';
class DictionaryListView extends StatefulWidget {
  const DictionaryListView({super.key, required this.dictionary,  this.shrinkWrap=false});
  
  final List<DictionaryEntity> dictionary;
final bool shrinkWrap;
  @override
  State<DictionaryListView> createState() => _DictionaryListViewState();
}

class _DictionaryListViewState extends State<DictionaryListView> {
  late ScrollController _scrollController;
  var nextPage = 2;
  var isLoading = false;

  // Define the colors
  final List<Color> backgroundColors = [
    Color(0xff2E8B58), // First color
    Color(0xff7BB092),  // Second color
    Color(0xff76CEC6),   // Third color
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels >= 0.7 * _scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchDictionaryListCubit>(context).fetchDictionaryList(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics:  widget.shrinkWrap ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
      shrinkWrap:widget.shrinkWrap ,
      itemCount: widget.dictionary.length,
      itemBuilder: (context, index) {
        // Get the color based on the index
        Color avatarColor = backgroundColors[index % backgroundColors.length];
        
        return DictionaryListViewItem(
          title: widget.dictionary[index].mainTitle,
          itemBackground: avatarColor, // Pass the color
        );
      },
    );
  }
}