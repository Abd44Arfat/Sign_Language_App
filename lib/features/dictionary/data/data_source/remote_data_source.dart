import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/dictionary/data/models/dictionary_model/dectionary.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';

abstract class DictionaryRemoteDataSource {
  Future<List<DictionaryEntity>> fetchDictionaryList();
}

class DictionaryRemoteDataSourceImpl extends DictionaryRemoteDataSource {
  @override
  final DioClient dioClient; // Use DioClient

  DictionaryRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<DictionaryEntity>> fetchDictionaryList() async {
    try {
      var response = await dioClient.get("http://10.0.2.2:3000/dectionary"); // Use DioClient's get method
      List<DictionaryEntity> dictionary = getDictionarysList(response.data);

      saveBooksData(dictionary, KDictionaryBox);
      return dictionary;
    } catch (e) {
      // Handle errors appropriately
      print('Error fetching dictionary list: $e');
      throw Failure('Error fetching dictionary list: $e');
    }
  }

  void saveBooksData(List<DictionaryEntity> dictionary, String boxName) {
    var box = Hive.box<DictionaryEntity>(boxName);
    box.addAll(dictionary);
  }

  List<DictionaryEntity> getDictionarysList(Map<String, dynamic> data) {
    List<DictionaryEntity> dictionary = [];
    for (var item in data['dectionaries']) {
      dictionary.add(Dectionary.fromJson(item) as DictionaryEntity);
    }
    return dictionary;
  }
}