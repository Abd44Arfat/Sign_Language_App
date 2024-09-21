import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/features/dictionary/domain/repos/dictionary_repo.dart';

class FetchDictionaryListUsecase
    extends UseCase<List<DictionaryEntity>, NoParam> {
  final DictionaryRepo dictionaryRepo;

  FetchDictionaryListUsecase({required this.dictionaryRepo});

  @override
  Future<Either<Failure, List<DictionaryEntity>>> call(
      [NoParam? params]) async {
    return await dictionaryRepo
        .fetchDictionaryList(); // Ensure this returns Either<Failure, List<DictionaryEntity>>
  }
}
