
import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/setting/data/datasource/remote_data_source.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_request.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_response.dart';
import 'package:sign_lang_app/features/setting/domain/repos/repos.dart';

class EditInfoRepoImpl extends EditInfoRepo {
  @override


  Future<Either<Failure, EditInfoResponse>> editInfo(EditInfoReqParams params) async {
    try {
      final result = await getIt<EditRemoteDataSource>().editInfo(params);

      // Check if the result is successful
      return result.fold(
        (failure) => Left(failure), // Return the failure
        (loginResponse) async {
          return Right(loginResponse);

          // Return the successful response
        },
      );
    } catch (e) {
      return Left(Failure(e.toString())); // Handle the exception as a failure
    }
  }

}