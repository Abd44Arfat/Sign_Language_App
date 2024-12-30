import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';

class HorizontalwordlistItem extends StatelessWidget {
  const HorizontalwordlistItem(
      {super.key,
      required this.text,
      this.onTap,
      this.arguments,
      required this.imagePath});
  final String text;
  final Function()? onTap;
  final Object? arguments;
  final String imagePath;
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
              /*boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3), // White shadow
                  offset: Offset(5, 5),
                  blurRadius: 6,
                ),
              ],*/
              border: Border.all(
                color: Colors.blue[900]!,
                //color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[600]),
          // Color(0xff131f23)),

          // color: Colors.blue[600]),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 44, width: 44, child: Image.asset(imagePath)),
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
    "Hello": "assets/3d_models/uploads_files_3775116_waitress_chr_lp.glb",
    "Thank You": "assets/3d_models/uploads_files_3775116_waitress_chr_lp.glb",
    "Help": "assets/3d_models/uploads_files_3775116_waitress_chr_lp.glb",
    "Love": "assets/3d_models/uploads_files_3775116_waitress_chr_lp.glb",
    "Danger": "assets/3d_models/uploads_files_3775116_waitress_chr_lp.glb",
    "Go": "assets/3d_models/uploads_files_3775116_waitress_chr_lp.glb",
  };

  final List<String> listOfIcons = [
    "assets/icons/hello.png",
    "assets/icons/thank_you.png",
    "assets/icons/helping-hand.png",
    "assets/icons/love.png",
    "assets/icons/warning.png",
    "assets/icons/go.png"
  ];

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
            imagePath: listOfIcons[index],
            text: text,
            arguments: {'fileName': name, 'text': text},
          );
        },
      ),
    );
  }
}
