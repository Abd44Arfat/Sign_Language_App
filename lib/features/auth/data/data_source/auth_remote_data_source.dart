import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_req.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_response_test.dart';


abstract class AuthRemoteDataSource {

  Future <Either<Failure, SignupResponse>> signUp(SignupReqParams SignupReq);


}
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<Either<Failure, SignupResponse>> signUp(SignupReqParams signupReq) async {
    try {
      var response = await getIt<DioClient>().post(
        "http://10.0.2.2:3000/auth/signup",
        data: signupReq.toMap(),
      );

      // Parse the response using SignupResponse.fromJson
      final signupResponse = SignupResponse.fromJson(response.data);

      // Check if the user is null, indicating failure
      if (signupResponse.user == null) {
        return Left(Failure(signupResponse.message)); // Return error message
      }

      return Right(signupResponse); // Return success
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      if (e.response != null) {
        print('Response data: ${e.response!.data}');

        final Map<String, dynamic> responseData = e.response!.data is Map<String, dynamic>
            ? e.response!.data
            : {};

        // Use fromJson to extract the error message
        final errorResponse = SignupResponse.fromJson(responseData);
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