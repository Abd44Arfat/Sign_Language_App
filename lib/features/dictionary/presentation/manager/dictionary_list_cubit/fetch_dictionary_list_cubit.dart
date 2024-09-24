import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/features/dictionary/domain/usecases/fetch_dictionary_list_useCase.dart';

part 'fetch_dictionary_list_state.dart';

class FetchDictionaryListCubit extends Cubit<FetchDictionaryListState> {
  FetchDictionaryListCubit(this.fetchDictionaryListUsecase)
      : super(FetchDictionaryListInitial());

  final FetchDictionaryListUsecase fetchDictionaryListUsecase;

  Future<void> fetchDictionaryList() async {
    emit(FetchDictionaryListLoading());

    var result = await fetchDictionaryListUsecase.call();
    result.fold(
      (failure) {
        emit(FetchDictionaryListFailure(failure.toString()));
        print(failure.toString());
      },
      (dictionaryList) {
        emit(FetchDictionaryListSuccess(dictionaryList));
      },
    );

    // Optionally return a value or just complete the method
    return; // This ensures the function completes properly.
  }
}
