import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class HorizontalwordlistItem extends StatelessWidget {
  const HorizontalwordlistItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8 ),
      child: Container(
      width: 200.w,
      height: 130.h,
      
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
         color: Color(0xff19221D)
  
          ),
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        
        SizedBox(
          height: 44,
          width: 44,
          child: Image.asset('assets/images/image_peofile.png')),
          SizedBox(height: 20.h,),
           FittedBox(child: Text('How Are Yoy',style: TextStyles.font20WhiteSemiBold,))
          
          ],
    ),
  ),    
      
      ),
    );}
}

class HorizontalWordList extends StatelessWidget {
  const HorizontalWordList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return HorizontalwordlistItem();
        },
      ),
    );
  }
}