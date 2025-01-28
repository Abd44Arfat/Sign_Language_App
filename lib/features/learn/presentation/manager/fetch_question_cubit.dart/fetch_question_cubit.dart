import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart';
import 'package:sign_lang_app/features/learn/domain/usecase/fetch_question_usecase.dart';

part 'fetch_question_state.dart';

class FetchQuestionCubit extends Cubit<FetchQuestionState> {
  final FetchQuestionListUsecase fetchQuestionListUsecase;

  FetchQuestionCubit({required this.fetchQuestionListUsecase})
      : super(FetchQuestionInitial());

  Future<void> fetchDictionaryList(String levelId) async {
    emit(FetchQuestionLoading());

    var result = await fetchQuestionListUsecase.call(levelId);
    result.fold(
      (failure) {
        debugPrint('Fetch failed: ${failure.message}');

        emit(FetchQuestionFailure(errmessage: failure.message));
      },
      (questionsList) {
        emit(FetchQuestionSuccess(questions: questionsList));
      },
    );
  }
}
