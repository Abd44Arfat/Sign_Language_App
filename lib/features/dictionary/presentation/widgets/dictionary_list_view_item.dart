import 'package:flutter/material.dart';
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
          // Add any navigation logic here if needed
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Color(0xff232229),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyles.font20WhiteSemiBold,
                ),
                IconButton(
                  icon: Icon(isSaved ? Icons.check : Icons.save), // Change icon based on saved state
                  color: Colors.white,
                  onPressed: isSaved ? null : onSave, // Disable save action if already saved
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}