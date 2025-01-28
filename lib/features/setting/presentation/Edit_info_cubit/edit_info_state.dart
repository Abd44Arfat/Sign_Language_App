part of 'edit_info_cubit.dart';

@immutable
sealed class EditInfoState {}

final class EditInfoInitial extends EditInfoState {}
final class EditInfoLoading extends EditInfoState {}
final class EditInfoSuccess extends EditInfoState {

final String userName;
final String message;
final String userEmail;

  EditInfoSuccess({required this.userName, required this.message, required this.userEmail});

}
final class EditInfoFailure extends EditInfoState {

  final String errorMessage;

  EditInfoFailure({required this.errorMessage});
}

