import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/learn/presentation/manager/fetch_avatar_signbefore_quiz_cubit/fetch_avatar_signbefore_quiz_cubit.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/continue_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarSignBeforeQuizView extends StatefulWidget {
  const AvatarSignBeforeQuizView({super.key});

  @override
  State<AvatarSignBeforeQuizView> createState() => _AvatarSignBeforeQuizViewState();
}

class _AvatarSignBeforeQuizViewState extends State<AvatarSignBeforeQuizView> {
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    // Fetch questions when the widget is initialized
    context.read<FetchAvatarSignbeforeQuizCubit>().fetchAvatarSignBeforeQuerList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FetchAvatarSignbeforeQuizCubit, FetchAvatarSignbeforeQuizState>(
        builder: (context, state) {
          if (state is FetchAvatarSignbeforeQuizLoading) {
            return Center(child: CircularProgressIndicator()); // Loading state
          } else if (state is FetchAvatarSignbeforeQuizSuccess) {
            final questions = state.AvatarList; // Get questions from the state

            // Ensure we don't go out of bounds
            if (_currentStep >= questions.length) {
              _currentStep = questions.length - 1; // Reset to last question if needed
            }

            double screenHeight = MediaQuery.of(context).size.height;

            return Column(
              children: [
                SizedBox(height: screenHeight * 0.20),
                CustomRefreshBtn(),
                Image.asset(
                  "assets/images/avatar.png",
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: screenHeight * 0.44,
                ),
                SignName(name: questions[_currentStep].text), // Update to fetch question text
                Spacer(),
                Row(
                  children: [
                    if (_currentStep > 0)
                      GestureDetector(
                        onTap: _goToPreviousQuestion,
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
                        text: _currentStep < questions.length - 1 ? 'Next Question' : 'Start Quiz',
                        onPressed: _goToNextQuestion,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            );
          } else if (state is FetchAvatarSignbeforeQuizFaliure) {
            return Center(child: Text('Error: ${state.errMessage}')); // Handle error state
          } else {
            return Center(child: Text('Unexpected state')); // Handle unexpected state
          }
        },
      ),
    );
  }

  void _goToNextQuestion() {
    final state = context.read<FetchAvatarSignbeforeQuizCubit>().state;
    
    if (state is FetchAvatarSignbeforeQuizSuccess) {
      setState(() {
        if (_currentStep < state.AvatarList.length - 1) {
          _currentStep++;
        } else {
          Navigator.pushNamed(context, Routes.quiz);
        }
      });
    }
  }

  void _goToPreviousQuestion() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
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