import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
class DictionaryListViewItem extends StatelessWidget {
  const DictionaryListViewItem({super.key, required this.title, required this.itemBackground});
  
  final String title;
  final Color itemBackground; // New parameter for color

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: ColorsManager.itembackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                topRight: Radius.zero,
                bottomRight: Radius.zero,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundColor: itemBackground, // Use the passed color
                    child: SvgPicture.asset('assets/images/item.svg'),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16), 
            Text(
              title,
              style: TextStyles.font20GrayMedium,
            ),
          ],
        ),
      ),
    );
  }
}