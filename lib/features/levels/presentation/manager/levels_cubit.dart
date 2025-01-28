import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/levels/domain/usecase/fetch_levels_usecase.dart';
import 'package:sign_lang_app/features/levels/presentation/manager/levels_state.dart';

class LevelsCubit extends Cubit<LevelsState> {
  final FetchLevelsUsecase fetchLevelsUsecase;
  LevelsCubit(this.fetchLevelsUsecase) : super(LevelsIntial());

  Future<void> fetchLevels(String categoryId) async {
    fetchLevelsUsecase(categoryId);
    emit(LevelsLoading());

    var result = await fetchLevelsUsecase(categoryId);
    result.fold((failure) {
      emit(LevelsFailure(failure.toString()));
    }, (data) {
      emit(LevelsSuccess(levels: data));
    });
  }
}
