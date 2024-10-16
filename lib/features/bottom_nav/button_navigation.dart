import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart'; // Import your Bloc
import 'package:sign_lang_app/features/dictionary/data/dictionary_repo_impl.dart';
import 'package:sign_lang_app/features/dictionary/domain/usecases/fetch_dictionary_list_useCase.dart';
import 'package:sign_lang_app/features/dictionary/presentation/dictionary_view.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';
import 'package:sign_lang_app/features/setting/presentation/setting_view.dart';
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
    screens = [
        BlocProvider(
            create: (context) => FetchDictionaryListCubit(
              FetchDictionaryListUsecase(
                dictionaryRepo:
                    getIt<DictionaryRepoImpl>(), // Use GetIt to fetch the repo
              ),
            )..fetchDictionaryList(),

            child: HomeView(),),
      const DictionaryView(),
      const SettingView(), // Replace with your actual settings page
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
          backgroundColor: Colors.white,
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