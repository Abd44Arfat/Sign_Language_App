

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

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
        border: Border.all(
            width: 2,
            color: Theme.of(context).colorScheme.onPrimary), // Colors.white),
        color: Colors.transparent,
      ),
      child: Center(
          child: Text(name,
              style: TextStyles.font20WhiteSemiBold
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary))),
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
            border: Border.all(width: 2, color: const Color(0xffCCA000)),
            color: const Color(0xffFFC800),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: SvgPicture.asset('assets/images/refresh.svg')),
        ),
      ),
    );
  }
}
