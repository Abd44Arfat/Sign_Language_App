import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/setting/data/model/user_info_model.dart';
import 'package:sign_lang_app/features/setting/domain/entity/edit_info_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/widgets/custom_button_animation.dart';
import '../../../domain/usecase/edit_info_usecase.dart';
import 'edit_profile_state.dart';
import 'package:flutter/material.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  // final EditInfoUseCase editInfoUseCase;
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  static EditProfileCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> updateUserInformation(
      {required EditInfoUseCase usecase,
      required EditInformationEntity entity}) async {
    emit(EditProfileLoading());
    btnKey.currentState!.animateForward();

    try {
      final Either<Failure, UserInfo> result = await usecase.call(entity);
      result.fold((error) {
        print('updating error: ${error.message}');
        emit(EditProfileFailure(msg: error.message));
        btnKey.currentState!.animateReverse();
      }, (data) async {
        emit(EditProfileSuccess(
            msg: 'User information updated successfully!',
            name: data.name ?? entity.name,
            email: data.email ?? entity.email));
        btnKey.currentState!.animateReverse();
      });
    } catch (e) {
      print('Exception: $e');
      emit(EditProfileFailure(msg: e.toString()));
    }
  }
}
