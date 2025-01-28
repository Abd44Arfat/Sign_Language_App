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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Container(
          width: 200.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //color: Color(0xff3d5a67)
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xff293d46)
                //: Color(0xff7BCE7E)
                : const Color(0xffe5eefd),
          ),
          // Color(0xff131f23)),

          // color: Colors.blue[600]),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: ImageIcon(AssetImage(imagePath), size: 20),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FittedBox(
                    child: Text(
                  text,
                  style: TextStyles.font20WhiteSemiBold.copyWith(
                      fontSize: 21,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onPrimary),
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
    "assets/icons/wave.png",
    "assets/icons/pray.png",
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
