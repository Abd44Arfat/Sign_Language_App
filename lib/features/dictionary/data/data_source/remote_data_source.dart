import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/dictionary/data/models/dictionary_model/dictionary_model.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';

abstract class DictionaryRemoteDataSource {
Future<List<DictionaryEntity>> fetchDictionaryList();



}


class DictionaryRemoteDataSourceImpl extends DictionaryRemoteDataSource{
  @override
   final ApiService apiService;

  DictionaryRemoteDataSourceImpl({required this.apiService});

  Future<List<DictionaryEntity>> fetchDictionaryList() async{
  var data= await apiService.get(endPoint: "/dectionary");


   List<DictionaryEntity> dictionary = getDictionarysList(data);

var box = Hive.box(KDictionaryBox);
    saveBooksData(dictionary, KDictionaryBox);
   return dictionary;
}


//but this in function i will refactor this 
void saveBooksData(List<DictionaryEntity> books, String boxName) {
  var box = Hive.box<DictionaryEntity>(boxName);
  box.addAll(books);
}

 List<DictionaryEntity> getDictionarysList(Map<String, dynamic> data) {
    List<DictionaryEntity> dictionary = [];
    for (var Item in data['items']) {
      dictionary.add(DictionaryModel.fromJson(Item) as DictionaryEntity);
    }
    return dictionary;
  }
}