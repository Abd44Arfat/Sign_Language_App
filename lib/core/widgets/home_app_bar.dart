import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
       
      
        leading: Image.asset('assets/images/image_peofile.png'),
        title: Text(
          'Good Morning',
          style: TextStyles.font14GrayRegular.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
        subtitle: Text(
          ' Abdelrahman Arfat',
          style: TextStyles.font16Blackbold.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}