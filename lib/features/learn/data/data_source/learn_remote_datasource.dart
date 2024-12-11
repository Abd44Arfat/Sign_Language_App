import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/avatar_sign_before_quiz_view.dart';

abstract class LearnRemoteDataSource {
  Future<Either<Failure, List<Questions>>> fetchQuestionList();
  Future<Either<Failure, LearnRes>> avatarSignBeforeQuizView();
}

class LearnRemoteDataSourceImpl extends LearnRemoteDataSource {
  @override
  final DioClient dioClient;

  LearnRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<Either<Failure, List<Questions>>> fetchQuestionList() async {
    try {
      var response = await dioClient.get(ApiUrls.questions);
      var questions = (response.data['level']['Questions'] as List)
          .map((json) => Questions.fromJson(json))
          .toList();
      return Right(questions);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LearnRes>> avatarSignBeforeQuizView() async {
    try {
      var response = await dioClient.get(ApiUrls.questions);
      var questions = (response.data['level']['Questions'] as List)
          .map((json) => Questions.fromJson(json))
          .toList();

      // Constructing the LearnRes object
      var level = Level(
        id: response.data['level']['_id'],
        name: response.data['level']['name'],
        category: response.data['level']['category'],
        questions: questions,
      );

      var learnRes = LearnRes(
        message: response.data['message'],
        level: level,
      );

      return Right(learnRes);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}