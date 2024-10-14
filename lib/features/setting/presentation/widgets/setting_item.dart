import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.title, required this.onTap});
  final String title;
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          height: 55.h,
          decoration: BoxDecoration(
            color: ColorsManager.itembackground,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff7BC578),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    title,
                    style: TextStyles.font20GrayMedium,
                  ),
                ],
              ),
              Icon(Iconsax.arrow_right_3_copy)
            ]),
          ),
        ),
      ),
    );
  }
}
