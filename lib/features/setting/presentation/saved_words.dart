import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/core/utils/constants.dart';

class SavedWordsScreen extends StatelessWidget {
  const SavedWordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Words'),
      ),
      body: FutureBuilder<List<DictionaryEntity>>(
        future: _fetchSavedWords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}',style: TextStyle(color: Colors.white),));
          } else if (snapshot.data!.isEmpty) {
            return Center(child: Text('No saved words found.',style: TextStyle(color: Colors.white),));
          }

          final savedWords = snapshot.data!;
          return ListView.builder(
            itemCount: savedWords.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(savedWords[index].mainTitle,style: TextStyle(color: Colors.white),),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<DictionaryEntity>> _fetchSavedWords() async {
    var box = Hive.box<DictionaryEntity>(KSavedwordsBox);
    return box.values.toList();
  }
}