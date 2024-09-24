import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/features/learn_view/learn_view.dart';
import 'package:sign_lang_app/features/setting_view/setting_view.dart';

import '../home_page/home_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  late List<Widget> screens;
  @override
  void initState() {
    super.initState();
    screens = const [
      HomeView(),
      LearnView(),
      SettingView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 27;
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, // Disable splash effect
          highlightColor: Colors.transparent, // Disable highlight effect
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: 'Home',
                icon: ImageIcon(
                    size: iconSize + 2,
                    const AssetImage('assets/icons/home.png'))),
            BottomNavigationBarItem(
              label: 'Learn',
              icon: ImageIcon(
                size: iconSize,
                const AssetImage('assets/icons/learning_icon.png'),
              ),
            ),
            BottomNavigationBarItem(
                label: 'Settings',
                icon: ImageIcon(
                  size: iconSize,
                  const AssetImage('assets/icons/menu.png'),
                )),
          ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
