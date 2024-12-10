import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/avatar_sign_before_quiz_view.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/nova_message.dart';

class LevelsViewBody extends StatelessWidget {
  const LevelsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return GuideBookListViewItem(index: index); // Pass the index
      },
    );
  }
}

class GuideBookListViewItem extends StatelessWidget {
  final List<Color> bgcolors = [
    const Color(0xff00CD0D),
    const Color(0xff843EF7),
    const Color(0xff156DE6),
    const Color(0xffFFDA18),
    const Color.fromARGB(255, 129, 219, 255),
    const Color(0xffDDB06D),
  ];

  final int index; // Add index as a parameter

  GuideBookListViewItem({super.key, required this.index}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, bottom: 0),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.signbeforeQuiz);
        },
        child: Container(
          height: 115,
          width: double.infinity, // Use full width
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Optional: Add some margin
          decoration: BoxDecoration(
            color: bgcolors[index],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Alternate avatar position based on index
              Positioned(
                left: index % 2 == 0 ? 10 : null, // Left if even index
                right: index % 2 == 0 ? null : 10, // Right if odd index
                bottom: 0,
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Image.asset('assets/images/avatar.png'),
                ),
              ),
        
              // Centering the text vertically
              Align(
                alignment: index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(right: index % 2 == 0 ? 30 : 0, left: index % 2 == 0 ? 0 : 30),
                  child: Text(
                    'Level ${index + 1}',
                    style: TextStyles.font30WhiteBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}