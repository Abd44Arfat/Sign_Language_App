import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
class CustomListile extends StatelessWidget {
  const CustomListile({super.key, required this.imageUrl, required this.title, required this.subtitle});
  final String imageUrl , title , subtitle;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: EdgeInsets.all(10),

      leading: Image.asset('$imageUrl' , width: 80, height: 80,),
      title:  Text(title , style: TextStyles.font20WhiteSemiBold.copyWith(fontWeight: FontWeight.w700 , fontSize: 22) ),
      subtitle: Text(subtitle , style: TextStyles.font18WhiteMedium.copyWith(fontSize: 18),),
    );
  }
}
