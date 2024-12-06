import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class CustomListile extends StatelessWidget {
  const CustomListile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle});
  final String imageUrl, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading: Image.asset(
        imageUrl,
        width: 80,
        height: 80,
      ),
      title: Text(title,
          style: TextStyles.font20WhiteSemiBold.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Theme.of(context).colorScheme.onPrimary)),
      subtitle: Text(
        subtitle,
        style: TextStyles.font18WhiteMedium.copyWith(
            fontSize: 18, color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
