import 'package:flutter/material.dart';

import '../theming/colors.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 70,
      centerTitle: false,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      title:  const Text('Welcome Back,' , style: TextStyle(fontSize: 23 , fontWeight: FontWeight.w700 , color: ColorsManager.gray)),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}
