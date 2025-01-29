import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';

abstract class LearnRepo {
  Future<Either<Failure, List<Question>>> fetchQuestionsList(String levelId);
  Future<Either<Failure, LearnRes>> avatarSignBeforeQuiz(String levelId);
}
