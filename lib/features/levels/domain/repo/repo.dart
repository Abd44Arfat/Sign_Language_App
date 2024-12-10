import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/levels/data/models/level_model.dart';

abstract class LevelsRepo {
  Future<Either<Failure, List<LevelModel>>> fetchLevels(String categoryId);
}
