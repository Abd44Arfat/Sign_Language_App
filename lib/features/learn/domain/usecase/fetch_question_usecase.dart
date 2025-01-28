import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';
import 'package:sign_lang_app/features/learn/domain/repo/question_repo.dart';

class FetchQuestionListUsecase extends UseCase<List<Questions>, String> {
  final LearnRepo learnRepo;

  FetchQuestionListUsecase({required this.learnRepo});

  @override
  Future<Either<Failure, List<Questions>>> call([String? param]) async {
    return await learnRepo.fetchQuestionsList(param!);
  }
}
