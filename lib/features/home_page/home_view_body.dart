import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/home_app_bar.dart';
import 'package:sign_lang_app/core/widgets/services_list_view.dart';
import 'package:sign_lang_app/core/widgets/speak_with_hands.dart';
import 'package:sign_lang_app/core/widgets/words_cards_list.dart';
import '../../core/widgets/build_common_words_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CustomScrollView(
        slivers: [
          HomeAppBar(),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 140,
            child: SpeakWithHands(),
          )),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 20,
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Text(
                'Services',
                style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: ServicesListView(),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 40,
          )),
          BuildCommonWordsHeader(),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          WordsCardsList()
        ],
      ),
    );
  }
}
