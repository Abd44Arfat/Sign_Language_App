import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/levels/presentation/manager/levels_cubit.dart';
import 'package:sign_lang_app/features/levels/presentation/manager/levels_state.dart';
import 'package:sign_lang_app/features/levels/presentation/widgets/levels_view_body.dart';

class LevelsView extends StatelessWidget {
  const LevelsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String categoryId = arguments!['categoryId'];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      //Color(0xff141F23),
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          //Theme.of(context).colorScheme.onSecondary,
          // Colors.white,
          shadowColor: Theme.of(context).colorScheme.onSecondary,
          // Colors.white,
          elevation: 1,
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          //Color(0xff141F23),
          centerTitle: true,
          title: Text(
            'Introduce your self',
            style: TextStyles.font20WhiteSemiBold
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          )),
      body: LevelsViewBody(
        categoryId: categoryId,
      ),
    );
  }
}
