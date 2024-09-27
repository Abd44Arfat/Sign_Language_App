import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sign_lang_app/core/widgets/app_text_form_field.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/fetch_list_view_bloc_builder.dart';

class DictionaryViewBody extends StatefulWidget {
  const DictionaryViewBody({super.key});

  @override
  _DictionaryViewBodyState createState() => _DictionaryViewBodyState();
}

class _DictionaryViewBodyState extends State<DictionaryViewBody> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 20),
              child: AppTextFormField(
                controller: _searchController,
                hintText: 'Search for a Word',
                prefixIcon:Icon(Iconsax.search_normal_1_copy,color: Colors.grey,) ,
              ),
            ),
            FetchDictionaryListViewBlocBuilder(searchText: _searchText),
          ],
        ),
      ),
    );
  }
}