import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';
import 'package:sign_lang_app/features/learn/domain/repo/question_repo.dart';

class AvatarBeforeQuizUsecase extends UseCase<LearnRes, String> {
  final LearnRepo learnRepo;

  AvatarBeforeQuizUsecase({required this.learnRepo});

  @override
  Future<Either<Failure, LearnRes>> call([String? param]) async {
    return await learnRepo.avatarSignBeforeQuiz(param!);
  }
}
