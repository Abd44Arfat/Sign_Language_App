
import 'package:flutter_bloc/flutter_bloc.dart';

class ScoreTrackerCubit extends Cubit<int> {
  final int totalQuestions;

  ScoreTrackerCubit({required this.totalQuestions}) : super(1);

  void incrementProgress() {
    if (state < totalQuestions ) {
      emit(state + 1);
    }
  }

  void decrementProgress() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}