import 'package:chiclet/chiclet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/features/learn/presentation/levels/widgets/Active_level.dart';
import 'package:sign_lang_app/features/learn/presentation/levels/widgets/non_active_level.dart';

class LevelsViewBody extends StatefulWidget {
  @override
  _LevelsViewBodyState createState() => _LevelsViewBodyState();
}

class _LevelsViewBodyState extends State<LevelsViewBody> {
  final List<String> items = ['Introduce Your Self', 'Body parts', 'Public places', 'Hobbies and Interests', 'School and Education'];

  // Define a list of colors
  final List<Color> colors = [
    Color(0xff58CC02),
    Color(0xffCE82FF),
    Color(0xff1CB0F6),
    Color(0xffFF86D0),
  ];

  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xff141F23),
      body: 
        Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: colors.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return LevelPage(
                  index: index,
                  items: items,
              
                );
              },
            ),
          


            Positioned(
              top: 60, 
              left: 8,
              right: 8,
              child: ChicletSegmentedButton(
                width: double.infinity,
                height: 80,
                buttonHeight: 6,
                children: [
                  ChicletButtonSegment(

                    backgroundColor: colors[currentIndex % colors.length],
                    onPressed: () {

context.pushNamed(Routes.Guidebook);


                    },
                    padding: EdgeInsets.zero,
                    child: SvgPicture.asset('assets/images/Guidebook.svg'),
                  ),
                  Expanded(
                    child: ChicletButtonSegment(
                      backgroundColor: colors[currentIndex % colors.length], // Change color based on scroll
                      onPressed: () {},
                      child:ListTile(
subtitle:Text(items[currentIndex],style: TextStyles.font20WhiteSemiBold,) ,
title:Text('Section ${currentIndex +1} unit${currentIndex+1}',style: TextStyles.font16WhiteMedium,) ,


                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    
  }
}

class LevelPage extends StatelessWidget {
  final int index;
  final List<String> items;


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

  LevelPage({
    required this.index,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height:screenHeight*0.06 ,),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActiveLevel(
                  item: items[index % items.length],
                  backgroundColor:  colors[index % colors.length], // Make it transparent if needed
                  borderColor:borderColors[index % borderColors.length] , // Set a default color
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}