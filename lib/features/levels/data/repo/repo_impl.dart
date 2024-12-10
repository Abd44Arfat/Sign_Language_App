import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/levels/data/data_source/remote_data_source.dart';
import 'package:sign_lang_app/features/levels/data/models/level_model.dart';
import 'package:sign_lang_app/features/levels/domain/repo/repo.dart';

class LevelsRepoImpl extends LevelsRepo {
  @override
  Future<Either<Failure, List<LevelModel>>> fetchLevels(
      String categoryId) async {
    try {
      final result =
          await getIt.get<LevelsRemoteDataSource>().fetchLevels(categoryId);
      return result.fold((failure) => Left(failure),
          (levelsModel) => Right(levelsModel.levelModel));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
