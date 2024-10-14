import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class DictionaryListViewItem extends StatelessWidget {
  const DictionaryListViewItem({super.key, required this.title});
final String title ;
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
              ), // Rounded corners on the left only, // Match the container's radius
    child:   Padding(
      padding: const EdgeInsets.only(left: 25),
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircleAvatar(
          
                          backgroundColor: Color(0xff6CC8FD),
                          child: SvgPicture.asset(
                            'assets/images/item.svg'
                          
                          )
                        ),
      ),
    ),
            ),
            const SizedBox(
                width: 16), 

            Text(
              title,
              style: TextStyles.font20GrayMedium,
            )
          ],
        ),
      ),
    );
  }
}
