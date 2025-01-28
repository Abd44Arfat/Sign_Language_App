import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/levels/data/models/level_model.dart';

abstract class LevelsRemoteDataSource {
  Future<Either<Failure, LevelsModel>> fetchLevels(String CategoryId);
}

class RemoteDataSourceImpl extends LevelsRemoteDataSource {
  final DioClient dio;
  RemoteDataSourceImpl({required this.dio});
  @override
  Future<Either<Failure, LevelsModel>> fetchLevels(String CategoryId) async {
    try {
      var response = await dio.get('${ApiUrls.category}/$CategoryId/level');
      LevelsModel levels = LevelsModel.fromJson(response.data);
      return Right(levels);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
