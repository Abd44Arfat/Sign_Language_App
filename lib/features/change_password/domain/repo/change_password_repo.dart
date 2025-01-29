import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_req.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_response.dart';

abstract class ChangePasswordRepo {
  Future<Either<Failure, ChangePasswordResponse>> changePass(
      ChangePasswordReq changePassReq);
}
