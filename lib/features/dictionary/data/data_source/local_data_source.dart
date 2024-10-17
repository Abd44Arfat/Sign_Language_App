import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';

abstract class DictionaryLocalDataSource {
  List<DictionaryEntity> fetchDictionaryList({int pageNumber=1});
}

class DictionaryLocalDataSourceImpl implements DictionaryLocalDataSource {

  
  @override
  List<DictionaryEntity> fetchDictionaryList({int pageNumber=1}) {

    int startIndex=pageNumber*10;
    int endIndex=(pageNumber+1)*10;
    var box = Hive.box<DictionaryEntity>(KDictionaryBox);
    int length =box.values.length;
    if(startIndex>length||endIndex>length){
      return [];
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }
}
