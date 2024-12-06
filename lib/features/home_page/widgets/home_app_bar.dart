import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/image_peofile.png'),
      title: Text(
        title,
        style: TextStyles.font14GrayRegular.copyWith(
          color: const Color(0xff949D9E),
        ),
      ),
      //subtitle: Text(subtitle, style: TextStyles.font16WhiteMedium),
      subtitle: Text(subtitle,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 20)),
      trailing: SvgPicture.asset('assets/images/notification.svg'),
    );
  }
}
