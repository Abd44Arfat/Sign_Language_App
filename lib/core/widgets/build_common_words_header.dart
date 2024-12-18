import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';

import '../routing/routes.dart';
import '../theming/colors.dart';

class BuildCommonWordsHeader extends StatelessWidget {
  const BuildCommonWordsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Common Words',
          style: TextStyles.font20WhiteSemiBold
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.dictionaryScreen);
            },
            child: GestureDetector(
              onTap: () => context.pushNamed(Routes.dictionaryScreen),
              child: Text(
                'See All',
                style: TextStyles.font16WhiteMedium
                    .copyWith(color: ColorsManager.primaryColor),
              ),
            )),
      ],
    );
  }
}
