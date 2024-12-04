import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/categories/data/models/category_res.dart';
import 'package:sign_lang_app/features/categories/domain/repo/repo.dart';

class FetchCategoriesListUsecase extends UseCase<List<CategoryModel>, NoParam> {
  final CategoryRepo categoryRepo;

  FetchCategoriesListUsecase({required this.categoryRepo});

  @override
  Future<Either<Failure, List<CategoryModel>>> call([NoParam? param]) async {
    return await categoryRepo.getCategories(); 
  }
}