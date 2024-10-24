import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/custom_background_color.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.userName});
final String userName; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomStack(
        child:  HomeViewBody(userName: userName,),
      ),
    );
  }
}