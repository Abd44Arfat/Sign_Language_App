import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/categories/data/models/category_res.dart';
import 'package:sign_lang_app/features/categories/domain/repo/repo.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';
import 'package:sign_lang_app/features/learn/domain/repo/question_repo.dart';

class FetchQuestionListUsecase extends UseCase<List<Questions>, NoParam> {
  final LearnRepo learnRepo;

  FetchQuestionListUsecase({required this.learnRepo});

  @override
  Future<Either<Failure, List<Questions>>> call([NoParam? param]) async {



    return await learnRepo.fetchQuestionsList();
  }
}