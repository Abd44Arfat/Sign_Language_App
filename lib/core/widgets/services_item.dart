import 'package:sign_lang_app/features/home_page/models/service_model.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.service, this.onTap});
  final void Function()? onTap;
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xffE8E8E8),
                borderRadius: BorderRadius.circular(10)),
            width: 110,
            height: 140,
            child: Column(
              children: [
                Text(
                  service.text,
                  style: TextStyle(fontSize: 19),
                ),
                service.imageStack
              ],
            )));
  }
}
