import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChecked});
  final bool isChecked;
  final ValueChanged<bool> onChecked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 30,
        height: 30,
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? Colors.green : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked ? Colors.transparent : const Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked
            ? Icon(Icons.check,color: Colors.white,)
            : const SizedBox(),
      ),
    );
  }
}