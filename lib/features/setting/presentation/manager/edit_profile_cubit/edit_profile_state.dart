sealed class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final String msg;
  final String name, email;
  EditProfileSuccess(
      {required this.msg, required this.name, required this.email});
}

class EditProfileFailure extends EditProfileState {
  final String msg;
  EditProfileFailure({required this.msg});
}
