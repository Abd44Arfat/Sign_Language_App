import 'package:chiclet/chiclet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NonActiveLevelWidget extends StatelessWidget {
  final String item;

  NonActiveLevelWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return ChicletOutlinedAnimatedButton(
      onPressed: () {},
      height: 70,
      width: 80,
      buttonHeight: 8,
      backgroundColor: Color(0xffE5E5E5),
      borderColor: Color(0xffB7B7B7),
      buttonType: ChicletButtonTypes.oval,
      child: SvgPicture.asset('assets/images/lock.svg'),
    );
  }
}