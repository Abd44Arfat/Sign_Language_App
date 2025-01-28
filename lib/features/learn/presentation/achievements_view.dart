import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/score_tracker_cubit/score_tracker_cubit.dart';

import 'package:sign_lang_app/features/learn/presentation/widgets/achievements_view_body.dart';

class AchievementsView extends StatelessWidget {
  const AchievementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => ScoreTrackerCubit(totalQuestions: 2),
      child: const AchievementsViewBody(),
    );
  }
}
