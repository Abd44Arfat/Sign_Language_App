import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/change_password/data/data_source/remote_data_source/change_password_remote_data_source.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_req.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_response.dart';
import 'package:sign_lang_app/features/change_password/domain/repo/change_password_repo.dart';

class ChangePasswordRepoImpl extends ChangePasswordRepo {
  @override
  Future<Either<Failure, ChangePasswordResponse>> changePass(
      ChangePasswordReq changePassReq) async {
    try {
      final result = await getIt<ChangePasswordRemoteDataSource>()
          .changePass(changePassReq);

      return result.fold((failure) => Left(failure),
          (changePassResponse) async {
        return Right(changePassResponse);
      });
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
