abstract class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {
  final String message;
  final String userName;
  final String userEmail;

  final String id;

  ChangePasswordSuccess({
    required this.userName,
    required this.message,
    required this.userEmail,
    required this.id,
  });
}

final class ChangePasswordFailure extends ChangePasswordState {
  final String errorMessage;

  ChangePasswordFailure({required this.errorMessage});
}
