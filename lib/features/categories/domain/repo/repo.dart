import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/categories/data/models/category_res.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}
