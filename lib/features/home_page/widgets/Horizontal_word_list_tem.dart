import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';

class HorizontalwordlistItem extends StatelessWidget {
  const HorizontalwordlistItem(
      {super.key, required this.text, this.onTap, this.arguments});
  final String text;
  final Function()? onTap;
  final Object? arguments;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(Routes.commonWordsScreen, arguments: arguments),
      //onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: 200.w,
          height: 130.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue[400]),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 44,
                    width: 44,
                    child: Image.asset('assets/images/image_peofile.png')),
                SizedBox(
                  height: 20.h,
                ),
                FittedBox(
                    child: Text(
                  text,
                  style: TextStyles.font20WhiteSemiBold,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalWordList extends StatefulWidget {
  const HorizontalWordList({super.key});

  @override
  State<HorizontalWordList> createState() => _HorizontalWordListState();
}

class _HorizontalWordListState extends State<HorizontalWordList> {
  final Map<String, String> listOfModels = {
    "hello": "assets/3d_models/DamagedHelmet.glb",
    "good": "assets/3d_models/DamagedHelmet.glb",
    "bad": "assets/3d_models/DamagedHelmet.glb"
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listOfModels.length,
        itemBuilder: (context, index) {
          final String name = listOfModels.values.toList()[index];
          final String text = listOfModels.keys.toList()[index];
          return HorizontalwordlistItem(
            text: text,
            arguments: {'fileName': name, 'text': text},
          );
        },
      ),
    );
  }
}
