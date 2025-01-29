import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_req.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_response.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<Either<Failure, ChangePasswordResponse>> changePass(
      ChangePasswordReq changePasswordReq);
}

class ChangePasswordRemoteDataSourceImpl
    extends ChangePasswordRemoteDataSource {
  @override
  Future<Either<Failure, ChangePasswordResponse>> changePass(
      ChangePasswordReq changePasswordReq) async {
    try {
      var response = await getIt<DioClient>()
          .patch(ApiUrls.changePass, data: changePasswordReq.toMap());

      final changePassResponse = ChangePasswordResponse.fromJson(response.data);
      if (changePassResponse.user == null) {
        return Left(Failure(changePassResponse.message));
      }
      return Right(changePassResponse);
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      if (e.response != null) {
        print('Response data: ${e.response!.data}');

        final Map<String, dynamic> responseData =
            e.response!.data is Map<String, dynamic> ? e.response!.data : {};

        // Use fromJson to extract the error message
        final errorResponse = ChangePasswordResponse.fromJson(responseData);
        return Left(Failure(errorResponse.message));
      }
      // Handle Dio error without a response
      return Left(Failure('Dio error: ${e.message}'));
    } catch (e) {
      print('Unexpected error: $e');
      return Left(Failure(e.toString()));
    }
  }
}
