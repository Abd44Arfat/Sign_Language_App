import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/routing/app_router.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';
import 'package:sign_lang_app/core/utils/simple_bloc_observer.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Retrieve user token from SharedPreferences
  String? userToken = await SharedPrefHelper.getString(SharedPrefKeys.userToken);

  // Check if the user is logged in
  bool isLoggedInUser = userToken != null && userToken.isNotEmpty;

  // Check if onboarding has been completed
  bool isOnboardingCompleted = await SharedPrefHelper.getBool(SharedPrefKeys.onboardingCompleted);



  Hive.registerAdapter(DictionaryEntityAdapter());
  await Hive.initFlutter();
  await Hive.openBox<DictionaryEntity>(KDictionaryBox);
 await Hive.openBox<DictionaryEntity>(KSavedwordsBox);
  Bloc.observer = SimpleBlocObserver();

  setupServiceLocator();

  runApp(MyApp(isLoggedInUser: isLoggedInUser, isOnboardingCompleted: isOnboardingCompleted));
}

class MyApp extends StatelessWidget {
  final bool isLoggedInUser;
  final bool isOnboardingCompleted;

  const MyApp({Key? key, required this.isLoggedInUser, required this.isOnboardingCompleted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Cairo',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedInUser
            ? Routes.bottomNavigation
            : (isOnboardingCompleted ? Routes.loginScreen : Routes.onBoardingScreen),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

