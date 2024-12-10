import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/categories/data/models/category_res.dart';
import 'package:sign_lang_app/features/categories/domain/usecase/fetch_categories_usecase.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.fetchCategoriesListUsecase) : super(CategoriesInitial());

  final FetchCategoriesListUsecase fetchCategoriesListUsecase;

  Future<void> fetchDictionaryList() async {
    emit(CategoriesLoading());

    var result = await fetchCategoriesListUsecase.call();
    result.fold(
      (failure) {
        emit(CategoriesFailure(errMessage: failure.toString()));
      },
      (categoriesList) {
        emit(CategoriesSuccess(categories: categoriesList));
      },
    );

    return;
  }
}
