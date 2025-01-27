import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_req.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_response.dart';
import 'package:sign_lang_app/features/change_password/domain/repo/change_password_repo.dart';

class ChangePasswordUsecase
    implements UseCase<ChangePasswordResponse, ChangePasswordReq> {
  @override
  Future<Either<Failure, ChangePasswordResponse>> call(
      [ChangePasswordReq? param]) async {
    return await getIt<ChangePasswordRepo>().changePass(param!);
  }
}
