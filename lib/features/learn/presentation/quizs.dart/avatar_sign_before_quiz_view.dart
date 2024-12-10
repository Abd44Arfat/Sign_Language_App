import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/continue_button.dart';

class AvatarSignBeforeQuizView extends StatefulWidget {
  const AvatarSignBeforeQuizView({super.key});

  @override
  State<AvatarSignBeforeQuizView> createState() => _AvatarSignBeforeQuizViewState();
}

class _AvatarSignBeforeQuizViewState extends State<AvatarSignBeforeQuizView> {
  int _currentStep = 0;
  final List<String> _questions = [
    'How Are You?',
    'What is your name?',
    'Where do you live?'
  ];

  void _goToNextQuestion() {
    setState(() {
      if (_currentStep < _questions.length - 1) {
        _currentStep++;
      } else {
        // Navigate to the quiz or reset logic
        Navigator.pushNamed(context, Routes.quiz);
      }
    });
  }

  void _goToPreviousQuestion() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.20),
          CustomRefreshBtn(),
          Image.asset(
            "assets/images/avatar.png",
            width: MediaQuery.sizeOf(context).width * 0.90,
            height: screenHeight * 0.44,
          ),
          SignName(name: _questions[_currentStep]),
          Spacer(),
          Row(
            children: [
              if (_currentStep > 0) // Show Previous button only if not on the first question
             GestureDetector(
              onTap:_goToPreviousQuestion ,
               child: Container(
                         height: 50.h,
                         width: 60.h,
                         decoration: BoxDecoration(
                           border: Border.all(width: 2, color: Color(0xffCCA000)),
                           color: Color(0xffFFC800),
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Icon(Iconsax.back_square),
                       
                  ),
             ),
              Expanded(
                child: ContinueButton(
                  text: _currentStep < _questions.length - 1 ? 'Next Question' : 'Start Quiz',
                  onPressed: _goToNextQuestion,
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

class SignName extends StatelessWidget {
  const SignName({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2, color: Colors.white),
        color: Colors.transparent,
      ),
      child: Center(child: Text(name, style: TextStyles.font20WhiteSemiBold)),
    );
  }
}

class CustomRefreshBtn extends StatelessWidget {
  const CustomRefreshBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          height: 50.h,
          width: 60.h,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Color(0xffCCA000)),
            color: Color(0xffFFC800),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: SvgPicture.asset('assets/images/refresh.svg')),
        ),
      ),
    );
  }
}