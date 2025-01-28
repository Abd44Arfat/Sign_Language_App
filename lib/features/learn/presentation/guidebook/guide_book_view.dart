import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/learn/presentation/guidebook/widgets/guide_book_view_body.dart';

class GuideBookView extends StatelessWidget {
  const GuideBookView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .colorScheme
          .primaryFixed, // const Color(0xff141F23),
      appBar: AppBar(
          forceMaterialTransparency: true,
          foregroundColor:
              Theme.of(context).colorScheme.onPrimary, // Colors.white,
          shadowColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 1,
          backgroundColor: Theme.of(context)
              .colorScheme
              .primaryFixed, // const Color(0xff141F23),
          centerTitle: true,
          title: Text(
            'Guide Book',
            style: TextStyles.font20WhiteSemiBold
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          )),
      body: const GuideBookViewBody(),
    );
  }
}
