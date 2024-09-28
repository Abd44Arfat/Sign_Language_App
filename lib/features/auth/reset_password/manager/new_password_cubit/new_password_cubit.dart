import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_password_state.dart';

class PasswordCubit extends Cubit<NewPasswordState> {
  PasswordCubit() : super(PasswordInitial());

  void checkPasswords(String password, String confirmPassword) {
    if (password.isEmpty || confirmPassword.isEmpty) {
      emit(PasswordError("Passwords cannot be empty"));
    } else if (password == confirmPassword) {
      emit(PasswordsMatch());
    } else {
      emit(PasswordsDoNotMatch());
    }
  }
  void updatePassword(String password) {
    if (password.isNotEmpty) {
      emit(PasswordUpdated()); // Password updated successfully
    } else {
      emit(PasswordError("Password cannot be empty"));
    }
  }
}