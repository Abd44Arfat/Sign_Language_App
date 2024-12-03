import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/widgets/custom_button_animation.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_req.dart';
import 'package:sign_lang_app/features/auth/data/models/signup_response.dart';
import 'package:sign_lang_app/features/auth/domain/usecases/signup_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(BuildContext context) => BlocProvider.of(context);

  final GlobalKey<CustomButtonState> btnKey = GlobalKey();

  void execute(
      {required SignupReqParams params, required SignupUsecase usecase}) async {
    emit(SignupLoading());
    btnKey.currentState!.animateForward();

    try {
      final Either<Failure, SignupResponse> result = await usecase.call(params);

      result.fold(
        (error) {
          print('Signup error: ${error.message}'); // Log the error message
          emit(SignupFailure(errorMessage: error.message));
          btnKey.currentState!.animateReverse();
        },
        (data) {
          print('Signup successful: ${data.message}'); // Log success message
          emit(SignupSuccess(
              message: data
                  .message)); // Ensure you pass the user's name if available
          btnKey.currentState!.animateReverse();
        },
      );
    } catch (e) {
      print('Exception occurred: $e'); // Log the exception
      emit(SignupFailure(errorMessage: e.toString()));
    }
  }
}
