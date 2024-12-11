import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/categories/data/models/category_res.dart';
import 'package:sign_lang_app/features/categories/domain/repo/repo.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';
import 'package:sign_lang_app/features/learn/domain/repo/question_repo.dart';

class AvatarBeforeQuizUsecase extends UseCase<LearnRes, NoParam> {
  final LearnRepo learnRepo;

  AvatarBeforeQuizUsecase({required this.learnRepo});

  @override
  Future<Either<Failure, LearnRes>> call([NoParam? param]) async {



    return await learnRepo.avatarSignBeforeQuiz();
  }
}