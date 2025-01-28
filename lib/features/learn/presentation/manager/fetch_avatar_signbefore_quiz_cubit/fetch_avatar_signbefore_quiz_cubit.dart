import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/learn/data/models/question_response.dart'; // Ensure this includes LearnRes
import 'package:sign_lang_app/features/learn/domain/usecase/sign_before_quiz_usecase.dart';

part 'fetch_avatar_signbefore_quiz_state.dart';

class FetchAvatarSignbeforeQuizCubit extends Cubit<FetchAvatarSignbeforeQuizState> {
  final AvatarBeforeQuizUsecase avatarBeforeQuizUsecase;

  FetchAvatarSignbeforeQuizCubit(this.avatarBeforeQuizUsecase) 
      : super(FetchAvatarSignbeforeQuizInitial());

  Future<void> fetchAvatarSignBeforeQuerList(String levelId) async {
    emit(FetchAvatarSignbeforeQuizLoading());

    final result = await avatarBeforeQuizUsecase.call(levelId);
    result.fold(
      (failure) {
        debugPrint('Fetch failed: ${failure.message}');
        emit(FetchAvatarSignbeforeQuizFaliure(errMessage: failure.message));
      },
      (learnRes) {
        // Assuming learnRes is of type LearnRes
        final questionsList = learnRes.level.questions; // Extracting questions from the level
        
        // Extracting signs from the questions
        final List<Signs> signData = questionsList.map((question) {
          return Signs(
            gifUrl: question.signs.gifUrl,
            text: question.signs.text,
          );
        }).toList();

        emit(FetchAvatarSignbeforeQuizSuccess(AvatarList: signData));
      },
    );
  }
}