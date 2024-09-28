abstract class NewPasswordState{}

class PasswordInitial extends NewPasswordState {}

class PasswordsMatch extends NewPasswordState {}

class PasswordsDoNotMatch extends NewPasswordState {}

class PasswordUpdated extends NewPasswordState {}

class PasswordError extends NewPasswordState {
  final String message;

  PasswordError(this.message);
}