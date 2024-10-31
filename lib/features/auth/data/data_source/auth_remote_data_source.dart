import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/auth/data/models/signIn_response.dart';
import 'package:sign_lang_app/features/auth/data/models/signin_req.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_req.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_response.dart';


abstract class AuthRemoteDataSource {

  Future <Either<Failure, SignupResponse>> signUp(SignupReqParams signupReq);

    Future<Either<Failure, LoginResponse >> signIn(SigninReqParams signInReq);


}
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<Either<Failure, SignupResponse>> signUp(SignupReqParams signupReq) async {
    try {
      var response = await getIt<DioClient>().post(

       ApiUrls.register,

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
  
  @override
  Future<Either<Failure, LoginResponse >> signIn(SigninReqParams signInReq)async {
 try {
      var response = await getIt<DioClient>().post(

    ApiUrls.login,
        data: signInReq.toMap(),
      );

      // Parse the response using SignupResponse.fromJson
      final loginResponse  = LoginResponse.fromJson(response.data);

      // Check if the user is null, indicating failure
      if (loginResponse.user == null) {
        return Left(Failure(loginResponse .message)); // Return error message
      }

      return Right(loginResponse); // Return success
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      if (e.response != null) {
        print('Response data: ${e.response!.data}');

        final Map<String, dynamic> responseData = e.response!.data is Map<String, dynamic>
            ? e.response!.data
            : {};

        // Use fromJson to extract the error message
        final errorResponse = LoginResponse .fromJson(responseData);
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