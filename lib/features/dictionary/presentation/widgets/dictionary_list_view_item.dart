import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/dictionary/presentation/dictionary_details_view.dart';

class DictionaryListViewItem extends StatelessWidget {
  const DictionaryListViewItem({
    super.key,
    required this.title,
    required this.onSave,
    required this.isSaved,
    required this.onRemove,
    required this.videoId, // New parameter
  });

  final String title;
  final VoidCallback onSave, onRemove;
  final bool isSaved;
  final String videoId; // Video ID for the related video

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DictionaryDetailsView(
                videoId: videoId,
                title: title,
              ),
            ),
          );
        },
        child: Container(
          height: 54.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyles.font20WhiteSemiBold.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22),
                ),
                GestureDetector(
                  onTap: isSaved ? onRemove : onSave,
                  child: SvgPicture.asset(
                    'assets/images/frame.svg',
                    color: isSaved
                        ? Colors.green
                        : Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
