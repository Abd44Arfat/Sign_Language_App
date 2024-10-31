import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/core/utils/constants.dart';

class SavedWordsScreen extends StatefulWidget {
  const SavedWordsScreen({super.key});

  @override
  _SavedWordsScreenState createState() => _SavedWordsScreenState();
}

class _SavedWordsScreenState extends State<SavedWordsScreen> {
  late Future<List<DictionaryEntity>> _savedWordsFuture;

  @override
  void initState() {
    super.initState();
    _savedWordsFuture = _fetchSavedWords(); // Initialize the future
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Words'),
      ),
      body: FutureBuilder<List<DictionaryEntity>>(
        future: _savedWordsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)));
          } else if (snapshot.data!.isEmpty) {
            return Center(child: Text('No saved words found.', style: TextStyle(color: Colors.white)));
          }

          final savedWords = snapshot.data!;
          return ListView.builder(
            itemCount: savedWords.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 330.w,
                  height: 64.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(savedWords[index].mainTitle,  style: TextStyles.font20WhiteSemiBold,),
                     
                     GestureDetector(
                      onTap: () async {
                    await _deleteSavedWord(savedWords[index].mainTitle); // Use the id for deletion
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Word deleted')),
                    );
                    setState(() {
                      _savedWordsFuture = _fetchSavedWords(); // Refresh the future
                    });
                  },
                      
                      
                      child: SvgPicture.asset('assets/images/Vector.svg')
      
                    )],
                    )
                  ),
                             
                    decoration: BoxDecoration(
                            color: Color(0xff232229),
                            borderRadius: BorderRadius.circular(15),
                          ),
                ),
              );
            },
          );
        },
      ),
    );
  }


  //         onPressed: () async {
                    // await _deleteSavedWord(savedWords[index].mainTitle); // Use the id for deletion
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Word deleted')),
                    // );
                    // setState(() {
                    //   _savedWordsFuture = _fetchSavedWords(); // Refresh the future
                    // });

  Future<List<DictionaryEntity>> _fetchSavedWords() async {
    var box = Hive.box<DictionaryEntity>(KSavedwordsBox);
    return box.values.toList();
  }

  Future<void> _deleteSavedWord(String title) async {
    var box = Hive.box<DictionaryEntity>(KSavedwordsBox);
    final index = box.values.toList().indexWhere((item) => item.mainTitle == title);
    if (index != -1) {
      await box.deleteAt(index); // Delete the item by index
    }
  }
}



