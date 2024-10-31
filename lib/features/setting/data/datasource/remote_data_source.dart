import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_request.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_response.dart';

abstract class EditRemoteDataSource {

  Future<Either<Failure, EditInfoResponse>> editInfo(EditInfoReqParams params);



}



class EditRemoteDataSourceImpl extends EditRemoteDataSource {
  @override
  Future<Either<Failure, EditInfoResponse>> editInfo(EditInfoReqParams params) async{

  try {
      final url = await ApiUrls.getEditInfoUrl();

      var response = await getIt<DioClient>().put(

      url,

        data: params.toMap(),
      );

      // Parse the response using SignupResponse.fromJson
      final editInfoResponse = EditInfoResponse.fromJson(response.data);

      // Check if the user is null, indicating failure
      if (editInfoResponse.user == null) {
        return Left(Failure(editInfoResponse.message)); // Return error message
      }

      return Right(editInfoResponse); // Return success
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      if (e.response != null) {
        print('Response data: ${e.response!.data}');

        final Map<String, dynamic> responseData = e.response!.data is Map<String, dynamic>
            ? e.response!.data
            : {};

        // Use fromJson to extract the error message
        final errorResponse = EditInfoResponse.fromJson(responseData);
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



