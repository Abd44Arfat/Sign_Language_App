import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

import 'package:sign_lang_app/features/learn/presentation/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color(0xff141F23),
appBar: AppBar(
  backgroundColor: Color(0xff202F36),title: Center(child: Text('Sections',style: TextStyles.font20WhiteSemiBold,)),)    ,
body:  Padding(
  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
  child: CategoriesViewBody(),
)

    );
  }
}