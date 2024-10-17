import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/home_page/widgets/home_app_bar.dart';
import 'package:sign_lang_app/core/widgets/speak_with_hands.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/fetch_list_view_bloc_builder.dart';
import 'package:sign_lang_app/features/dictionary/presentation/widgets/fetch_list_view_bloc_builder.dart';
import 'package:sign_lang_app/features/home_page/widgets/Horizontal_word_list_tem.dart';
import 'package:sign_lang_app/features/home_page/widgets/services_widget.dart';
import '../../core/widgets/build_common_words_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {


    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        CustomHomeAppBar(title: 'Good Morning', subtitle: 'Abdelrahman Arfat',)

             ,  SizedBox(
                height: 140,
                child: SpeakWithHands(),
              ),
            
        
              SizedBox(
                height: 10,),
           
          SizedBox(
                height: 40,
                child: Text(
                  'Services',
                  style: TextStyles.font20WhiteSemiBold
                 
                  
                 
                ),
              ),
            




ServicesWidget(),
      
 
   SizedBox(
            height: 12,),
 BuildCommonWordsHeader(),

          
   SizedBox(
            height: 12,),

 HorizontalWordList(),

 
      
          ],
        ),
      ),
    );
  }
}




 // child:  Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      //   child: CustomScrollView(
      //     slivers: [
      //      SliverToBoxAdapter(child: CustomHomeAppBar(title: 'Good Morning', subtitle: 'Abdelrahman Arfat',)),
      //        SliverToBoxAdapter(
      //         child: SizedBox(
      //           height: 12,)),
      //       SliverToBoxAdapter(
      //         child: SizedBox(
      //           height: 140,
      //           child: SpeakWithHands(),
      //         ),
      //       ),
      //        SliverToBoxAdapter(
      //         child: SizedBox(
      //           height: 10,)),
      //       SliverToBoxAdapter(
      //         child: SizedBox(
      //           height: 40,
      //           child: Text(
      //             'Services',
      //             style: TextStyle(
      //               fontSize: 22,
      //               fontFamily: 'Cairo',
      //               fontWeight: FontWeight.w600),
      //           ),
      //         ),
      //       ),
      //       SliverToBoxAdapter(
      //         child: SizedBox(
      //           height: 150,
      //           child: ServicesListView(),
      //         ),
      //       ),

          
      // // Show first 5 items
      
      //       SliverToBoxAdapter(child: BuildCommonWordsHeader()),
      //           SliverToBoxAdapter(
      //         child: SizedBox(
      //           height: 10,)),
      //       SliverToBoxAdapter(
      
      //               child: FetchDictionaryListViewBlocConsumer(itemCount: 5,shrinkWrap: true,)),
      
      //     ],
      //   ),
      // ),