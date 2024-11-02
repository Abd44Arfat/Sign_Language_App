import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../manager/score_tracker_cubit/score_tracker_cubit.dart';
class QuestionsTracker extends StatefulWidget {
  const QuestionsTracker({super.key, required this.totalQ});
   final int totalQ ;

  @override
  State<QuestionsTracker> createState() => _QuestionsTrackerState();
}

class _QuestionsTrackerState extends State<QuestionsTracker> {


  @override
  Widget build(BuildContext context) {
        return BlocBuilder<ScoreTrackerCubit, int>(
        builder: (context, progress) {
      return LinearPercentIndicator(
          animateFromLastPercent:true,
          barRadius: const Radius.circular(13),
          animationDuration: 1000,
          animation: true,
          width: MediaQuery.sizeOf(context).width * 0.85,
          lineHeight: 25,
          percent: progress / context.read<ScoreTrackerCubit>().totalQuestions,
          progressColor: Colors.green[300],

      ); });






  }
}
