import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key,
      required this.title,
      required this.onTap,
      this.backIcon = true});
  final String title;
  final void Function() onTap;
  final bool backIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          height: 55.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xff7BC578),
                          child: SvgPicture.asset(
                              'assets/images/shield-security.svg'),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        title,
                        style: TextStyles.font20GrayMedium.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ],
                  ),
                  backIcon
                      ? const Icon(Iconsax.arrow_right_3_copy)
                      : const SizedBox()
                ]),
          ),
        ),
      ),
    );
  }
}
