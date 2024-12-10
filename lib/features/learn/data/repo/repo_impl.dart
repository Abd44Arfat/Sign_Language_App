import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';

import 'package:sign_lang_app/features/learn/data/data_source/learn_remote_datasource.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';
import 'package:sign_lang_app/features/learn/domain/repo/question_repo.dart';

class LearnRepoImpl extends LearnRepo {
  @override
  Future<Either<Failure, List<Questions>>> fetchQuestionsList() async {
    try {
      // Fetch question list from remote data source
      final result = await getIt<LearnRemoteDataSource>().fetchQuestionList();

      // Use fold to handle success and failure
      return result.fold(
        (failure) => Left(failure), // Return the failure as is
        (questions) => Right(questions), // Return the list of questions
      );
    } catch (e) {
      // Handle any unforeseen errors
      return Left(Failure(e.toString()));
    }
  }
}