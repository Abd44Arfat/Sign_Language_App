import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/styles.dart';
import 'package:sign_lang_app/features/learn/presentation/widgets/nova_message.dart';

class GuideBookViewBody extends StatelessWidget {
  const GuideBookViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return GuideBookListViewItem(index: index); // Pass the index
      },
    );
  }
}

class GuideBookListViewItem extends StatelessWidget {
  final List<String> items = [
    'Welcome',
    'How Are You',
    'Bye',
    'Good Morning',
    'Good Afternoon',
  ];
  
  final int index; // Add index as a parameter

  GuideBookListViewItem({super.key, required this.index}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 100,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Optional: Add some margin
      decoration: BoxDecoration(
        color: Color(0xff202F36),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 3.0,
          color: Color(0xff39464E),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xff141F23),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Section 1', // Display section number based on index
                  style: TextStyles.font20WhiteSemiBold,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 50,
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/avatar.png'),
            ),
          ),
          Positioned(
            left: 150,
            bottom: 50,
            child: SizedBox(
              width: 150,
              height: 150,
              child: NovaMessage(
                text: items[index % items.length], // Use index to get the correct item
              
              ),
            ),
          ),
        ],
      ),
    );
  }
}