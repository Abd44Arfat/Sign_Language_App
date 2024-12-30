import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/questions_tracker.dart';

import '../manager/score_tracker_cubit/score_tracker_cubit.dart';
import 'achievment2.dart';
import 'acievment1.dart';

class AchievementsViewBody extends StatefulWidget {
  const AchievementsViewBody({
    super.key,
  });

  @override
  State<AchievementsViewBody> createState() => _AchievementsViewBodyState();
}

class _AchievementsViewBodyState extends State<AchievementsViewBody>
    with SingleTickerProviderStateMixin {
  late final pageViewController;
  int _previousPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController(
      initialPage: 0,
      viewportFraction: 1.0,
      keepPage: true,
    );
  }

  final List<Widget> _pages = <Widget>[];
  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  void navigateToNextPage() {
    pageViewController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeOutSine,
    );
  }

  void _onPageChanged(int index) {
    if (index > _previousPageIndex) {
      context.read<ScoreTrackerCubit>().incrementProgress();
    } else if (index < _previousPageIndex) {
      context.read<ScoreTrackerCubit>().decrementProgress();
    }
    _previousPageIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    _pages.addAll([
      Achievement1(
        onPressed: navigateToNextPage,
      ),
      const Achievement2(),
    ]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding:
              EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.08),
          //color: Colors.white,
          color: Theme.of(context).colorScheme.onSecondary,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //Navigator.pushReplacementNamed(context, Routes.bottomNavigation);
                    //Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.grey[500],
                  )),
              const QuestionsTracker(
                totalQ: 2,
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView.builder(
            // padEnds: false,
            physics: const NeverScrollableScrollPhysics(),
            controller: pageViewController,
            onPageChanged: (index) {
              _onPageChanged(index);
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) => _pages[index],
          ),
        ),
      ],
    );
  }
}
