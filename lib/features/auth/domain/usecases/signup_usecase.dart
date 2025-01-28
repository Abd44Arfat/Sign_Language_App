import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/usecase/usecase.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_req.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_response.dart';
import 'package:sign_lang_app/features/auth/domain/repos/auth_repo.dart';


class SignupUsecase implements UseCase<SignupResponse,SignupReqParams> {
  @override
  Future<Either<Failure, SignupResponse>> call([SignupReqParams? param])async {
return await getIt<AuthRepo>().signUp(param!);



  }
}