import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/learn/presentation/levels/widgets/Active_level.dart';
import 'package:sign_lang_app/features/learn/presentation/levels/widgets/non_active_level.dart';


class LevelsViewBody extends StatelessWidget {
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'Categories',
            style: TextStyles.font20WhiteSemiBold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF353535),
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActiveLevel(item: items[1],),
                ],
              ),





              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25),
                child: Row(
                  children: [
                    NonActiveLevelWidget(item: items[0]), // Reference to ItemWidget
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.10),
                child: Row(
                  children: [
                    NonActiveLevelWidget(item: items[2]), // Reference to NonActiveItemWidget
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25),
                child: Row(
                  children: [
                    NonActiveLevelWidget(item: items[3]), // Reference to NonActiveItemWidget
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NonActiveLevelWidget(item: items[4]), // Reference to NonActiveItemWidget
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}