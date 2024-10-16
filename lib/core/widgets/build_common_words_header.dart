import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

import '../routing/routes.dart';
import '../theming/colors.dart';
import 'app_text_button.dart';

class BuildCommonWordsHeader extends StatelessWidget {
  const BuildCommonWordsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
    const Text(
      'Common Words',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    ),
GestureDetector(
  
  onTap: () {
    Navigator.pushNamed(context,Routes.dictionaryScreen);
  },
  child: Text('See All',style: TextStyles.font16WhiteMedium.copyWith(color: ColorsManager.green),
  )
  ),
          ],
        );
  }
}
