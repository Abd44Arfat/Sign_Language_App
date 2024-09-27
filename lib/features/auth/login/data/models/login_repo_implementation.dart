import 'package:dartz/dartz.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/login_repo.dart';

class LoginRepoImpl extends LoginRepo{
  @override
  Future<UserEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isUserLoggedIn(String email, String password) {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserEntity>>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> requestPasswordReset(String email) {
    // TODO: implement requestPasswordReset
    throw UnimplementedError();
  }

}