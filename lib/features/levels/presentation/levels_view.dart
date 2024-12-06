import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/levels/presentation/widgets/levels_view_body.dart';

class LevelsView extends StatelessWidget {
  const LevelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
backgroundColor: Color(0xff141F23),
appBar: AppBar(
  foregroundColor: Colors.white,
  shadowColor: Colors.white,
  elevation: 1,
  backgroundColor: Color(0xff141F23),centerTitle: true,title: Text('Introduce your self',style: TextStyles.font20WhiteSemiBold,
  
  )),
      body:  LevelsViewBody(),
    );
  }
}