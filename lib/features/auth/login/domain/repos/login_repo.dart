import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class LoginRepo {
  Future<bool> isUserLoggedIn(String email , String password);
  Future<Either<Failure, List<UserEntity>>> login(String email , String password);
  Future<void> requestPasswordReset(String email);
  Future<UserEntity> getCurrentUser();
}