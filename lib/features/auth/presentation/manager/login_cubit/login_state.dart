part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
final String message;
  final String userName;
    final String userEmail;
  
  final String id;

  LoginSuccess(  {required this.userName,required this.message,required this.userEmail,required this.id,});

}
final class LoginFailure extends LoginState {

 final String errorMessage;

  LoginFailure({required this.errorMessage}); 

}
