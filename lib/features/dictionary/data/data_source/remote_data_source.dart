import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';

abstract class DictionaryRemoteDataSource {
Future<List<DictionaryEntity>> fetchDictionaryList();



}


class DictionaryRemoteDataSourceImpl extends DictionaryRemoteDataSource{
  @override
  Future<List<DictionaryEntity>> fetchDictionaryList() {
   

}