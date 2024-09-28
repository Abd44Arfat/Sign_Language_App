abstract class VerificationState {}

class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationSuccess extends VerificationState {}

class VerificationError extends VerificationState {
  final String message;
  VerificationError(this.message);
}

class VerificationFormValid extends VerificationState {}

class VerificationFormInvalid extends VerificationState {
  final List<bool> emptyFields; // Indicates which fields are empty

  VerificationFormInvalid(this.emptyFields);
}