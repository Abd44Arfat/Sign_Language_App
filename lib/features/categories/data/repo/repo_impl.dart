import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/categories/data/data_sourece/remote_data_source.dart';
import 'package:sign_lang_app/features/categories/data/models/category_res.dart';
import 'package:sign_lang_app/features/categories/domain/repo/repo.dart';

class CategoriesRepoImpl extends CategoryRepo {
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      // Fetch category results from remote data source
      final result =
          await getIt<CategoriesRemoteDataSource>().fetchCategoryList();

      // Use fold to handle success and failure
      return result.fold(
        (failure) => Left(failure), // Return the failure as is
        (categoryRes) => Right(categoryRes
            .categories), // Extract and return the list of categories
      );
    } catch (e) {
      // Handle any unforeseen errors
      return Left(Failure(e.toString()));
    }
  }
}
