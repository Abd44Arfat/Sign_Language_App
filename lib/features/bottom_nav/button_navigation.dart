import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/features/categories/categories_view.dart';
import 'package:sign_lang_app/features/categories/domain/usecase/fetch_categories_usecase.dart';
import 'package:sign_lang_app/features/categories/presentation/manager/cubit/categories_cubit.dart';
// Import your Bloc
import 'package:sign_lang_app/features/dictionary/data/dictionary_repo_impl.dart';
import 'package:sign_lang_app/features/dictionary/domain/usecases/fetch_dictionary_list_useCase.dart';
import 'package:sign_lang_app/features/dictionary/presentation/dictionary_view.dart';
import 'package:sign_lang_app/features/dictionary/presentation/manager/dictionary_list_cubit/fetch_dictionary_list_cubit.dart';

import '../home_page/home_view.dart';
import '../setting/presentation/views/setting_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation(
      {super.key, required this.userName, required this.userEmail});
  final String userName;
  final String userEmail;

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
      const HomeView(),
      //  const LearnInstructionsWelcomeMsgView(),

      BlocProvider(
        create: (context) => FetchDictionaryListCubit(
          FetchDictionaryListUsecase(
            dictionaryRepo:
                getIt<DictionaryRepoImpl>(), // Use GetIt to fetch the repo
          ),
        )..fetchDictionaryList(),
        child: const DictionaryView(),
      ),

      BlocProvider(
        create: (context) =>
            CategoriesCubit(getIt<FetchCategoriesListUsecase>()),
        child: const CategoriesView(),
      ),

      const SettingView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      body: screens[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primaryFixed,
          // Set background color

          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Home',
              icon: ImageIcon(
                size: 29,
                AssetImage('assets/icons/home.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'dictionary',
              icon: ImageIcon(
                size: 27,
                AssetImage('assets/icons/learning_icon.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Learn',
              icon: ImageIcon(
                size: 27,
                AssetImage('assets/images/menu-board.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: ImageIcon(
                size: 27,
                AssetImage('assets/icons/menu.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
