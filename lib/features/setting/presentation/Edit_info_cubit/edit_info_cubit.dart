
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/widgets/custom_button_animation.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_request.dart';
import 'package:sign_lang_app/features/setting/data/models/edit_info_response.dart';
import 'package:sign_lang_app/features/setting/domain/usecases/edit_info_usecase.dart';

part 'edit_info_state.dart';

class EditInfoCubit extends Cubit<EditInfoState> {

final DioClient dioClient;


  EditInfoCubit(this.dioClient) : super(EditInfoInitial());


    static EditInfoCubit get(BuildContext context) => BlocProvider.of(context);
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();


 void execute({required EditInfoReqParams params, required EditInfoUsecase usecase}) async {
    emit(EditInfoLoading());
    btnKey.currentState!.animateForward();

    try {
      final Either<Failure, EditInfoResponse> result = await usecase.call(params);

      result.fold(
        (error) {
          print('Edit Info error: ${error.message}'); // Log the error message
          emit(EditInfoFailure(errorMessage: error.message));
          btnKey.currentState!.animateReverse();
        },
        (data) async {
      
  
          print('edit profile successful: ${data.message}'); // Log success message
          emit(EditInfoSuccess(
            message: data.message,
            userName: data.user!.name,
            userEmail: data.user!.email,
          )); // Ensure you pass the user's name if available
          btnKey.currentState!.animateReverse();
        },
      );
    } catch (e) {
      print('Exception occurred: $e'); // Log the exception
      emit(EditInfoFailure(errorMessage: e.toString()));
    }
  }




}
