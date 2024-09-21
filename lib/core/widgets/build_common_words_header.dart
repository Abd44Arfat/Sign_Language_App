import 'package:flutter/material.dart';

import '../routing/routes.dart';
import '../theming/colors.dart';
import 'app_text_button.dart';

class BuildCommonWordsHeader extends StatelessWidget {
  const BuildCommonWordsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Common Words',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
        ),
        AppTextButton(
          buttonText: 'See All',
          backgroundColor: Colors.transparent,
          buttonWidth: 80,
          buttonHeight: 80,
          textStyle: const TextStyle(
            fontSize: 20,
            color: ColorsManager.green,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Routes.commonWordsScreen);
          },
        )
      ],
    ));
  }
}
