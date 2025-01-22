import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/features/learn/presentation/quizs.dart/avatar_sign_before_quiz_view.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/continue_button.dart';

class CommonWordsViewBody extends StatefulWidget {
  const CommonWordsViewBody({super.key, required this.arguments});
  final Map? arguments;
  @override
  State<CommonWordsViewBody> createState() => _CommonWordsViewBodyState();
}

class _CommonWordsViewBodyState extends State<CommonWordsViewBody> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.20),
          const CustomRefreshBtn(),
          SizedBox(
              height: screenHeight * 0.44,
              //width: MediaQuery.of(context).size.width * 0.90,
              child: Flutter3DViewer(src: widget.arguments?['fileName'])),
          SignName(name: widget.arguments?['text']),
          //name: widget.arguments?['text'] ??""), //list.text), // Update to fetch question text
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: ContinueButton(
                  text: 'Done',
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }
}
