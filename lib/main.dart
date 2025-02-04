import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/routing/app_router.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';
import 'package:sign_lang_app/core/utils/simple_bloc_observer.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:sign_lang_app/features/setting/presentation/manager/theme_cubit/theme_cubit.dart';

void main() async {
  final widgetsFlutterBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);
  // Retrieve user token from SharedPreferences
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);

  // Check if the user is logged in
  bool isLoggedInUser = userToken != null && userToken.isNotEmpty;

  // Check if onboarding has been completed
  bool isOnboardingCompleted =
      await SharedPrefHelper.getBool(SharedPrefKeys.onboardingCompleted);

  Hive.registerAdapter(DictionaryEntityAdapter());
  await Hive.initFlutter();
  await Hive.openBox<DictionaryEntity>(KDictionaryBox);
  await Hive.openBox<DictionaryEntity>(KSavedwordsBox);
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(MyApp(
      isLoggedInUser: isLoggedInUser,
      isOnboardingCompleted: isOnboardingCompleted));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final bool isLoggedInUser;
  final bool isOnboardingCompleted;

  const MyApp(
      {super.key,
      required this.isLoggedInUser,
      required this.isOnboardingCompleted});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemesCubit(),
      child:
          BlocBuilder<ThemesCubit, ThemeData>(builder: (context, themeState) {
        bool isDarkTheme = themeState.brightness == Brightness.dark;
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
              //statusBarColor: Colors.transparent, // Make status bar transparent
              statusBarIconBrightness:
                  isDarkTheme ? Brightness.light : Brightness.dark,
              statusBarBrightness:
                  isDarkTheme ? Brightness.dark : Brightness.light),
        );
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          child: MaterialApp(
            theme: themeState.copyWith(
              // Update this to set the CircularProgressIndicator color
              colorScheme: themeState.colorScheme.copyWith(
                primary: Colors.green, // Set the primary color to green
                secondary:
                    Colors.green, // Optional: Set secondary color to green too
              ),
              // Optionally, if you want to specifically set the progress indicator color
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                color: Colors.green, // Set CircularProgressIndicator color
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: isLoggedInUser
                ? Routes.bottomNavigation
                : (isOnboardingCompleted
                    ? Routes.loginScreen
                    : Routes.onBoardingScreen),
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      }),
    );
  }
}
