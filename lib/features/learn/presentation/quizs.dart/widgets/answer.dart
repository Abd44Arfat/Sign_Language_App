import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  final Color backgroundColor;

  const Answer(this.selectHandler, this.answerText,
      {super.key, this.backgroundColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectHandler,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          height: 60.h,
          width: 260.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 2, color: Theme.of(context).colorScheme.onPrimary),
            color: backgroundColor,
          ),
          child: Center(
            child: Text(answerText, style: TextStyles.font20WhiteSemiBold.copyWith(color:  Theme.of(context).colorScheme.onPrimary)),
          ),
        ),
      ),
    );
  }
}
