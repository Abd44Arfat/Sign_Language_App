import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/features/dictionary/domain/usecases/fetch_dictionary_list_useCase.dart';

part 'fetch_dictionary_list_state.dart';

class FetchDictionaryListCubit extends Cubit<FetchDictionaryListState> {
  FetchDictionaryListCubit(this.fetchDictionaryListUsecase)
      : super(FetchDictionaryListInitial());

  final FetchDictionaryListUsecase fetchDictionaryListUsecase;

  Future<void> fetchDictionaryList({int pageNumber=1}) async {
    
    if (pageNumber == 1) {
  emit(FetchDictionaryListLoading());
}else{
  emit(FetchDictionaryListPaginationLoading());
}

    var result = await fetchDictionaryListUsecase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber==1) {
  emit(FetchDictionaryListFailure(failure.toString()));
}else{
  emit(FetchDictionaryListPaginationFailure(errMessage: failure.toString()));
}
        print(failure.toString());
      },
      (dictionaryList) {
        // print();
        emit(FetchDictionaryListSuccess(dictionaryList));
      },
    );

    return; 
  }
}
