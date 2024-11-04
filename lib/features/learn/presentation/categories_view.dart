import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'package:sign_lang_app/features/auth/reset_password/presentation/widgets/custom_app_bar.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
  backgroundColor: Colors.green,title: Center(child: Text('Categories',style: TextStyles.font20WhiteSemiBold,)),)    ,
body:  Padding(
  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
  child: CategoriesViewBody(),
)

    );
  }
}