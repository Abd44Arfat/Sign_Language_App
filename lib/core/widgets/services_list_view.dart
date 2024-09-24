import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/widgets/services_item.dart';
import 'package:sign_lang_app/models/service_model.dart';

class ServicesListView extends StatefulWidget {
  const ServicesListView({super.key});

  @override
  State<ServicesListView> createState() => _ServicesListViewState();
}

class _ServicesListViewState extends State<ServicesListView> {
  final List<ServiceModel> services = [
    ServiceModel(
        imageStack: Stack(
          children: [
            Positioned(
              top: 25,
              left: 22,
              child: Image.asset(
                'assets/icons/circle.png',
                width: 45,
                height: 45,
              ),
            ),
            Image.asset(
              'assets/icons/translate.png',
              width: 75,
              height: 75,
            ),
          ],
        ),
        text: 'Translate'),
    ServiceModel(
        imageStack: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Image.asset(
                'assets/icons/circle.png',
                width: 66,
                height: 66,
              ),
              Positioned(
                left: -8,
                child: Image.asset(
                  'assets/icons/learn.png',
                  width: 77,
                  height: 77,
                ),
              ),
            ],
          ),
        ),
        text: 'Learn'),
    ServiceModel(
        imageStack: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Image.asset(
                'assets/icons/circle.png',
                width: 65,
                height: 65,
              ),
              Image.asset(
                'assets/icons/dectionary.png',
                width: 67,
                height: 67,
              ),
            ],
          ),
        ),
        text: 'Dictionary'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ServiceItem(
              service: services[index],
            ),
          );
        });
  }
}
