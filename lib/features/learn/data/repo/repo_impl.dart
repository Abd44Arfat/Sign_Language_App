import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';

import 'package:sign_lang_app/features/learn/data/data_source/learn_remote_datasource.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';
import 'package:sign_lang_app/features/learn/domain/repo/question_repo.dart';

class LearnRepoImpl extends LearnRepo {
  @override
  Future<Either<Failure, List<Questions>>> fetchQuestionsList(String levelId) async {
    try {
      final result = await getIt<LearnRemoteDataSource>().fetchQuestionList(levelId);
      return result.fold(
        (failure) => Left(failure), 
        (questions) => Right(questions),
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, LearnRes>> avatarSignBeforeQuiz(String levelId) async {
    try {
      final result = await getIt<LearnRemoteDataSource>().avatarSignBeforeQuizList(levelId);

      // Ensure the type matches
      return result.fold(
        (failure) => Left(failure), 
        (signs) {
          return Right(signs);
        },
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}