import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/styles.dart';

class DictionaryListViewItem extends StatelessWidget {
  const DictionaryListViewItem({
    super.key,
    required this.title,
    required this.onSave,
    required this.isSaved, // New parameter
  });

  final String title;
  final VoidCallback onSave; // Callback for save action
  final bool isSaved; // Track if the item is saved

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.DictionaryDetailsView);
        },
        child: Container(
          height: 70,
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
                  style: TextStyles.font20WhiteSemiBold
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                GestureDetector(
                    onTap: isSaved ? null : onSave,
                    child: SvgPicture.asset(
                      isSaved
                          ? 'assets/images/Vector.svg'
                          : 'assets/images/frame.svg',
                      color: isSaved
                          ? Colors.green
                          : Theme.of(context).colorScheme.onPrimary,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
