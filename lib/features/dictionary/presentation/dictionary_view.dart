import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/dictionary_view_body.dart';

class DictionaryView extends StatelessWidget {
  const DictionaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: ColorsManager.lightGray,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.white), // Back icon
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Pops back to the previous screen
                },
              ),
            ),
          ),
        ),
        body: DictionaryViewBody(),
      ),
    );
  }
}
