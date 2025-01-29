part of 'fetch_avatar_signbefore_quiz_cubit.dart';

@immutable
sealed class FetchAvatarSignbeforeQuizState {}

final class FetchAvatarSignbeforeQuizInitial extends FetchAvatarSignbeforeQuizState {}
final class FetchAvatarSignbeforeQuizLoading extends FetchAvatarSignbeforeQuizState {}
final class FetchAvatarSignbeforeQuizSuccess extends FetchAvatarSignbeforeQuizState {


final List<Question> AvatarList;

  FetchAvatarSignbeforeQuizSuccess({required this.AvatarList});
}
final class FetchAvatarSignbeforeQuizFaliure extends FetchAvatarSignbeforeQuizState {


  final String errMessage;

  FetchAvatarSignbeforeQuizFaliure({required this.errMessage});
}
