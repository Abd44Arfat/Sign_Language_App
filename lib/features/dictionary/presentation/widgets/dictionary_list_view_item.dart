import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
class DictionaryListViewItem extends StatelessWidget {
  const DictionaryListViewItem({super.key, required this.title, required this.itemBackground});
  
  final String title;
  final Color itemBackground; // New parameter for color

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context,Routes.DictionaryDetailsView);
        },
        child: Container(
          height: 130.h,
          decoration: BoxDecoration(
            color: itemBackground,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                 
                     Container(
                      height: 44.h,
                      width: 44.w,
                       child: CircleAvatar(
                                         
                          child: Image.asset('assets/images/image_peofile.png'),
                        ),
                     ),
                    
                  
                
           
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyles.font20WhiteSemiBold,
                    ),
                    Icon(Iconsax.arrow_right_1_copy,color: Colors.white,)
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