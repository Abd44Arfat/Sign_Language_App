import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_req.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_response_test.dart';
import 'package:sign_lang_app/features/auth/domain/repos/auth_repo.dart';


class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, SignupResponse>>signUp(SignupReqParams SignupReq) {

return getIt<AuthRemoteDataSource>().signUp(SignupReq);

  }
}