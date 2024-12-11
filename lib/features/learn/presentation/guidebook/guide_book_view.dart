import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/learn/presentation/guidebook/widgets/guide_book_view_body.dart';

class GuideBookView extends StatelessWidget {
  const GuideBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: Color(0xff141F23),
appBar: AppBar(
  foregroundColor: Colors.white,
  shadowColor: Colors.white,
  elevation: 1,
  backgroundColor: Color(0xff141F23),centerTitle: true,title: Text('Guide Book',style: TextStyles.font20WhiteSemiBold,
  
  )),
      body:  GuideBookViewBody(),
    );
  }
}

