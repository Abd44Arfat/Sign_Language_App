import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
class CustomAppBar extends StatelessWidget {
  final String pageName;
  const CustomAppBar({super.key , required this.pageName});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: screenWidth * 0.05,),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16)
            ),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios_new) , color: Colors.grey,),
          ),
          SizedBox(width: screenWidth * 0.22,),
          Text(pageName , style: TextStyles.font18WhiteSemiBold.copyWith(fontSize: 28 ) ,textAlign: TextAlign.center,),
          SizedBox(width: screenWidth * 0.30,)
        ],

    );
  }
}
