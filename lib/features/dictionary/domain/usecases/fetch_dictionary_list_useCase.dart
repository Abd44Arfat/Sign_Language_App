import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/dictionary/domain/Entities/dictionary_entity.dart';
import 'package:sign_lang_app/features/dictionary/domain/repos/dictionary_repo.dart';

class FetchDictionaryListUsecase {
  final DictionaryRepo dictionaryRepo;

  FetchDictionaryListUsecase({required this.dictionaryRepo});
  Future<Either<Failure, List<DictionaryEntity>>> fetchDictionaryList() {
    return dictionaryRepo.fetchDictionaryList();
  }
}
