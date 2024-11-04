import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/learn/presentation/levels/widgets/Active_level.dart';
import 'package:sign_lang_app/features/learn/presentation/levels/widgets/non_active_level.dart';

class LevelsViewBody extends StatelessWidget {
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  
  // Define a list of colors
  final List<Color> colors = [
    Color(0xff58CC02),
    Color(0xffCE82FF),
    Color(0xff1CB0F6),
    Color(0xffFF86D0),
  ];
    final List<Color> borderColors = [
    Color(0xff58A700),
    Color(0xffA568CC),
    Color(0xff168DC5),
    Color(0xffCC6BA6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'Levels',
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
        child: PageView.builder(
          itemCount: colors.length, // Use the number of colors as the item count
          scrollDirection: Axis.vertical, // Set to vertical scrolling
          itemBuilder: (context, index) {
            return LevelPage(index: index, items: items, colors: colors, borderColors: borderColors,); // Pass the colors list
          },
        ),
      ),
    );
  }
}

class LevelPage extends StatelessWidget {
  final int index;
  final List<String> items;
  final List<Color> colors; 
    final List<Color> borderColors; 

  // Accept colors list

  LevelPage({required this.index, required this.items, required this.colors, required this.borderColors});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActiveLevel(
                item: items[index % items.length],
                backgroundColor: colors[index % colors.length],
                
                 borderColor:borderColors[index%borderColors.length] , // Pass the color
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25),
            child: Row(
              children: [
                NonActiveLevelWidget(item: items[(index + 1) % items.length]), // Next level
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.10),
            child: Row(
              children: [
                NonActiveLevelWidget(item: items[(index + 2) % items.length]), // Next level
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25),
            child: Row(
              children: [
                NonActiveLevelWidget(item: items[(index + 3) % items.length]), // Next level
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NonActiveLevelWidget(item: items[(index + 4) % items.length]), // Next level
            ],
          ),
        ],
      ),
    );
  }
}