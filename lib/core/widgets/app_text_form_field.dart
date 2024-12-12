import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  // final Function(String?) validator;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.prefixIcon,
    this.onSaved,
    // required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            Theme.of(context).inputDecorationTheme.focusedBorder,
        enabledBorder: enabledBorder ??
            Theme.of(context).inputDecorationTheme.enabledBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        focusedErrorBorder:
            Theme.of(context).inputDecorationTheme.focusedErrorBorder,
        hintStyle:
            hintStyle ?? Theme.of(context).inputDecorationTheme.hintStyle,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor:
            backgroundColor ?? Theme.of(context).inputDecorationTheme.fillColor,
        filled: true,
      ),
      obscuringCharacter: '*', //'●',
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium.copyWith(color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field is required';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
