import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';

abstract class DictionaryRepo {
  Future<Either<Failure, List<DictionaryEntity>>> fetchDictionaryList({int pageNumber=1});
}
