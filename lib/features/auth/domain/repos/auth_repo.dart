import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_req.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_response_test.dart';


abstract class AuthRepo {


  Future<Either<Failure, SignupResponse>> signUp(SignupReqParams params);
}