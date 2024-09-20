import 'package:sign_lang_app/models/service_model.dart';
import 'package:flutter/material.dart';
class ServicesListView extends StatelessWidget {
  const ServicesListView({super.key});
  final List<ServiceModel> services = const [
    ServiceModel(imageUrl: 'assets/icons/translate.png', text: 'Translate'),
    ServiceModel(imageUrl: 'assets/icons/learn.png', text: 'Learn'),
    ServiceModel(imageUrl: 'assets/icons/dictionary.png', text: 'Dictionary'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: services.length,
      itemBuilder: (context , index ) {
        GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            //  color: Color(0xffd9d9d9),
            borderRadius: BorderRadius.circular(10)
          ),
          width: 100,
          height: 100,
          child: Column(
            children: [
              Text(services[index].text),
              Image.asset(services[index].imageUrl )
            ],
          ),
        ),
      );}
    );
  }
}
