import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/categories/data/models/category_res.dart';

abstract class CategoriesRemoteDataSource {
  Future<Either<Failure, CategoryRes>> fetchCategoryList();
}

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  @override
  final DioClient dioClient;

  CategoriesRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<Either<Failure, CategoryRes>> fetchCategoryList() async {
    try {
      // Fetch data from the API
      var response = await dioClient.get(ApiUrls.category);

      // Parse the response data into a CategoryRes object
      CategoryRes categories = getDictionarysList(response.data);

      // Return the result wrapped in Right
      return Right(categories);
    } catch (e) {
      // Return the error wrapped in Left
      return Left(Failure(e.toString()));
    }
  }

  // Refactored to return CategoryRes
  CategoryRes getDictionarysList(Map<String, dynamic> data) {
    // Call fromJson to convert the JSON data into a CategoryRes object
    return CategoryRes.fromJson(data);
  }
}
