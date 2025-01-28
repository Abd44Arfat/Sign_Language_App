import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/auth/data/models/signIn_response.dart';
import 'package:sign_lang_app/features/auth/data/models/signin_req.dart';
import 'package:sign_lang_app/features/auth/domain/repos/auth_repo.dart';

class SignInUsecase implements UseCase<LoginResponse, SigninReqParams> {
  @override
  Future<Either<Failure, LoginResponse>> call([SigninReqParams? param]) async {
    return await getIt<AuthRepo>().signIn(param!);
  }
}
