import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_req.dart';
import 'package:sign_lang_app/features/change_password/data/model/change_password_response.dart';
import 'package:sign_lang_app/features/change_password/domain/use_case/change_password_usecase.dart';
import 'package:sign_lang_app/features/change_password/presentation/manager/change_password_state.dart';
import 'package:sign_lang_app/core/widgets/custom_button_animation.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final DioClient dioClient;

  ChangePasswordCubit({required this.dioClient})
      : super(ChangePasswordInitial());

  static ChangePasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();

  void execute(
      {required ChangePasswordReq params,
      required ChangePasswordUsecase usecase}) async {
    emit(ChangePasswordLoading());
    btnKey.currentState!.animateForward();
    try {
      final Either<Failure, ChangePasswordResponse> result =
          await usecase.call(params);

      result.fold(
        (error) {
          print('Login error: ${error.message}'); // Log the error message
          emit(ChangePasswordFailure(errorMessage: error.message));
          btnKey.currentState!.animateReverse();
        },
        (data) async {
          //await saveUserdata(data.user!.email, data.user!.name, data.user!.id);
          // Save email and username
          print('Change password successful ...'); // Log success message
          emit(ChangePasswordSuccess(
            message: data.message,
            userName: data.user!.name,
            userEmail: data.user!.email,
            id: data.user!.id,
          ));
          btnKey.currentState!.animateReverse();
        },
      );
    } catch (e) {
      print('Exception occurred: $e'); // Log the exception
      emit(ChangePasswordFailure(errorMessage: e.toString()));
    }
  }
}
