import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/theming/font_Weight_helper.dart';
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
  final String? initialValue; // New nullable initialValue parameter

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
    this.initialValue, // Include initialValue in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue, // Set initialValue here
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
        suffixIconColor: Theme.of(context).colorScheme.onPrimary,
        prefixIcon: prefixIcon,
        prefixIconColor: Theme.of(context).colorScheme.onPrimary,
        fillColor:
            backgroundColor ?? Theme.of(context).inputDecorationTheme.fillColor,
        filled: true,
      ),
      obscuringCharacter: '*',
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeightHelper.semiBold),
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
