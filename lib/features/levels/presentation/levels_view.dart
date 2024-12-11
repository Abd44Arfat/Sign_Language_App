import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/features/categories/presentation/categories_view_body.dart';
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
        actions: [

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 22.0),
  child: GestureDetector(

    onTap:(){ context.pushNamed(Routes.Guidebook);},
    child: SizedBox(
      
      height: 30,
      width: 30,
      child: SvgPicture.asset('assets/images/Guidebook.svg')),
  ),
)

        ],
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
