part of 'fetch_dictionary_list_cubit.dart';

@immutable
sealed class FetchDictionaryListState {}

final class FetchDictionaryListInitial extends FetchDictionaryListState {}

final class FetchDictionaryListLoading extends FetchDictionaryListState {}

final class FetchDictionaryListSuccess extends FetchDictionaryListState {
  final List<DictionaryEntity> dictionaryList;
  FetchDictionaryListSuccess(this.dictionaryList);
}

final class FetchDictionaryListFailure extends FetchDictionaryListState {
  final String errMessage;
  FetchDictionaryListFailure(this.errMessage);
}