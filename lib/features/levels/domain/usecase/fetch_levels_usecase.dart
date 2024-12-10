import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/levels/data/models/level_model.dart';
import 'package:sign_lang_app/features/levels/domain/repo/repo.dart';
/*
abstract class LevelsUseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}*/

class FetchLevelsUsecase extends UseCase<List<LevelModel>, String> {
  LevelsRepo levelsRepo;

  FetchLevelsUsecase({required this.levelsRepo});

  @override
  Future<Either<Failure, List<LevelModel>>> call([String? param]) async {
    if (param != null) {
      return await levelsRepo.fetchLevels(param);
    } else {
      return await levelsRepo.fetchLevels("674f660becf04384591e1535");
    }
  }
}
