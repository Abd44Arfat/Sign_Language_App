import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
class AboutUsMainFeatures extends StatelessWidget {
  const AboutUsMainFeatures({super.key});

  final List<String> mainFeatures = const ['Real-time translation of sign language gestures to spoken words, supporting both Arabic and English.'
   , 'Easy-to-use interface with intuitive design tailored for seamless interaction.' ,
  'Continuous learning and updates to improve translation accuracy with each use.'];

  @override
  Widget build(BuildContext context) {
    return _showMainFeatures(mainFeaturesList: mainFeatures);
  }

  Widget _showMainFeatures({required List<String> mainFeaturesList}){
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics() ,
      shrinkWrap: true,
      itemBuilder: (context , index){
       return Text('${index+1} . ${mainFeaturesList[index]}' , style: TextStyles.font18WhiteMedium.copyWith(fontSize: 24),);
    } , itemCount: mainFeaturesList.length,);
  }
}