import 'package:sign_lang_app/features/levels/data/models/level_model.dart';

abstract class LevelsState {}

class LevelsIntial extends LevelsState {}

class LevelsLoading extends LevelsState {}

class LevelsFailure extends LevelsState {
  final String e;
  LevelsFailure(this.e);
}

class LevelsSuccess extends LevelsState {
  final List<LevelModel> levels;
  LevelsSuccess({required this.levels});
}
