import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class DictionaryListViewItem extends StatelessWidget {
  const DictionaryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70.h,
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
              child: Image.asset(
                "assets/images/onboarding3.png",
                width: MediaQuery.of(context).size.width *
                    0.40, // Adjust width as needed
                height: 80.h, // Match the container height
                fit: BoxFit.cover, // Ensure the image fills the space
              ),
            ),
            const SizedBox(
                width: 16), // Add space between image and other widgets
            // Additional widgets can be added here if needed

            Text(
              "How Are You",
              style: TextStyles.font16GraySemibold,
            )
          ],
        ),
      ),
    );
  }
}
