import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/auth/reset_password/manager/verification_cubit/verification_state.dart';
import 'package:flutter/material.dart';
class VerificationCubit extends Cubit<VerificationState>{
  VerificationCubit() : super(VerificationInitial());
  bool isValid =false;
  void validateForm(List<String> codes) {
    // Check if any of the text fields are empty
    List<bool> emptyFields = codes.map((code) => code.isEmpty).toList();

    // Emit state based on validation
    if (emptyFields.contains(true)) {
      // If any field is empty, emit the `VerificationFormInvalid` state
      emit(VerificationFormInvalid(emptyFields));
    } else {
      // If all fields are filled, emit the `VerificationFormValid` state
      emit(VerificationFormValid());
    }
  }
 /*void checkValidation(GlobalKey<FormState> _key ) {
    if (_key.currentState!.validate()) {
      isValid=true;

  /*  bool isValid = verificationCodeFields.every((field) => field.isNotEmpty);
    if (isValid) {
      emit(VerificationFormValid());*/
    } else {
      isValid =false;
    }
  }
  void validateForm(){
    isValid ==true ? emit(VerificationFormValid()) :  emit(VerificationFormInvalid());
  }*/
 /*Future<void> submitVerificationCode(List<String> verificationCodeFields) async {

  }*/
}