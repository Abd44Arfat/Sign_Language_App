import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/local_data_source.dart';
import 'package:sign_lang_app/features/dictionary/data/data_source/remote_data_source.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/features/dictionary/domain/repos/dictionary_repo.dart';

class DictionaryRepoImpl extends DictionaryRepo {
  final DictionaryRemoteDataSource dictionaryRemoteDataSource;
  final DictionaryLocalDataSourceImpl dictionaryLocalDataSource;
  DictionaryRepoImpl(
      {required this.dictionaryRemoteDataSource,
      required this.dictionaryLocalDataSource});
  @override
  Future<Either<Failure, List<DictionaryEntity>>> fetchDictionaryList({int pageNumber=1}) async {
    try {
      var dictionaryList = dictionaryLocalDataSource.fetchDictionaryList(
pageNumber: pageNumber

      );
      if (dictionaryList.isNotEmpty) {
        return right(dictionaryList);
      }
      var dictionary = await dictionaryRemoteDataSource.fetchDictionaryList(

pageNumber: pageNumber

      );
      return right(dictionary);
    } catch (e) {
      return left((Failure(e.toString())));
    }
  }
}
