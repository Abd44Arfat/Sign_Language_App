import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/font_Weight_helper.dart';

class TextStyles {
  static TextStyle font14BlackMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
//for form fields
 static TextStyle font14BGreyRegular= TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.grey,
  );
 
//for appButton
  static TextStyle font18BWhiteSemiBold= TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

 static TextStyle font16BlackRegular= TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );







}
