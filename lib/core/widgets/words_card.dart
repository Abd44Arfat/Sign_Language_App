import 'package:flutter/material.dart';

class WordsCard extends StatelessWidget {
  const WordsCard({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: SizedBox(
          height: 90,
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 150,
                decoration: const BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 28,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.normal),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
