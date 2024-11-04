import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/learn/presentation/levels/levels_view.dart';

class LevelsView extends StatelessWidget {
  const LevelsView({super.key});

  @override

  Widget build(BuildContext context) {
    return  Scaffold(

 appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'Levels',
            style: TextStyles.font20WhiteSemiBold,
          ),
        ),
      ),

body:LevelsViewBody() ,


    );
  }
}