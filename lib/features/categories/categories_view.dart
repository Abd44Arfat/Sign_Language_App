import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

import 'package:sign_lang_app/features/categories/presentation/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryFixed,
          title: Center(
              child: Text(
            'Sections',
            style: TextStyles.font20WhiteSemiBold
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          )),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: CategoriesViewBody(),
        ));
  }
}
