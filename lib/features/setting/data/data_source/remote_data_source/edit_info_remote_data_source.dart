import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/features/setting/data/model/user_info_model.dart';
import 'package:sign_lang_app/features/setting/domain/entity/edit_info_entity.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../../auth/data/models/signIn_response.dart';

class EditInfoRemoteDataSource{
  final User? user;
  final DioClient dioClient;
  EditInfoRemoteDataSource(this.dioClient , {this.user});
  final String baseUrl = ApiUrls.baseURL;

  Future<Either <Failure ,UserInfo>>  saveUserInfo(EditInformationEntity entity) async {

    try{
      var response = await getIt<DioClient>().put('$baseUrl/api/user/${user?.id}' , data: entity.toMap());
      final userInfoResponse = UserInfo.fromJson(response.data);
      final id= userInfoResponse.id ;
        return right(userInfoResponse) ;
    }

    on DioException catch (e) {
    print('Dio error: ${e.message}');
    if (e.response != null) {
    print('Response data: ${e.response!.data}');

    final Map<String, dynamic> responseData = e.response!.data is Map<String, dynamic>
    ? e.response!.data
        : {};

    final errorResponse = UserInfo.fromJson(responseData);
    return left(Failure(errorResponse.toString()));
    }

    return Left(Failure('Dio error: ${e.message}'));
    } catch (e) {
    print('Unexpected error: $e');
    return Left(Failure(e.toString()));
    }

  }
}