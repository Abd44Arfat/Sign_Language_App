part of 'fetch_question_cubit.dart';

@immutable
sealed class FetchQuestionState {}

final class FetchQuestionInitial extends FetchQuestionState {}
final class FetchQuestionLoading extends FetchQuestionState {}
final class FetchQuestionSuccess extends FetchQuestionState {

final List<Question> questions;

  FetchQuestionSuccess({required this.questions});

}
final class FetchQuestionFailure extends FetchQuestionState {

final String errmessage;

  FetchQuestionFailure({required this.errmessage});

}
