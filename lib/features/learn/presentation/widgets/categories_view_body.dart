import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of image paths
    final List<String> imagePaths = [
      'assets/images/intoduce_your_self.svg',
      'assets/images/body_parts.svg',
      'assets/images/hobbies.svg',
       'assets/images/favourites.svg',
      'assets/images/public_blaces.svg',
         'assets/images/nature.svg',
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: imagePaths.length, 
      itemBuilder: (BuildContext context, int index) {
   
        return CategoriesItem(imagePath: imagePaths[index]);
      },
    );
  }
}

class CategoriesItem extends StatelessWidget {
  final String imagePath;

  const CategoriesItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffD2FFC1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Text('Introduce \nYour Self',style: TextStyles.font16GraySemibold.copyWith(color:const Color(0xff325A4B)),),
          
          SizedBox(height: 14,),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 75,
                width: 75,
                child: SvgPicture.asset(imagePath,
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}