import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
class DictionaryListViewItem extends StatelessWidget {
  const DictionaryListViewItem({super.key, required this.title, });
  
  final String title;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context,Routes.DictionaryDetailsView);
        },
        child: Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: Color(0xff232229),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                 
              
                  
                
           
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyles.font20WhiteSemiBold,
                    ),
                   SvgPicture.asset('assets/images/frame.svg')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}